import mysql.connector
from bears.models.database_model import Database


def verificar_semestre(name):
    conn = Database.get_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT id_semestre FROM semestres WHERE nombre=%s", (name,))
    row = cur.fetchone()
    if row:
        conn.close()
        return row['id_semestre']
    cur.execute("INSERT INTO semestres (nombre) VALUES (%s)", (name,))
    conn.commit()
    sid = cur.lastrowid
    conn.close()
    return sid


def verificar_materia(semester_id, name):
    conn = Database.get_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT id_materia FROM materias WHERE id_semestre=%s AND nombre=%s", (semester_id, name))
    row = cur.fetchone()
    if row:
        conn.close()
        return row['id_materia']
    cur.execute("INSERT INTO materias (id_semestre, nombre) VALUES (%s, %s)", (semester_id, name))
    conn.commit()
    mid = cur.lastrowid
    conn.close()
    return mid


def verificar_unidad(materia_id, name):
    conn = Database.get_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT id_unidad FROM unidades WHERE id_materia=%s AND nombre=%s", (materia_id, name))
    row = cur.fetchone()
    if row:
        conn.close()
        return row['id_unidad']
    cur.execute("INSERT INTO unidades (id_materia, nombre) VALUES (%s, %s)", (materia_id, name))
    conn.commit()
    uid = cur.lastrowid
    conn.close()
    return uid


def insertar_pregunta(id_unidad, q, a, b, c, d, correct):
    conn = Database.get_connection()
    cur = conn.cursor()
    cur.execute(
        "INSERT INTO preguntas (id_unidad, pregunta_texto, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta) "
        "VALUES (%s, %s, %s, %s, %s, %s, %s)",
        (id_unidad, q, a, b, c, d, correct),
    )
    conn.commit()
    conn.close()


# Create/ensure first-semester subjects requested by the user.
semester1 = verificar_semestre('Primer Semestre')
semester2 = verificar_semestre('Segundo Semestre')
semester3 = verificar_semestre('Tercer Semestre')
semester4 = verificar_semestre('Cuarto Semestre')
semester5 = verificar_semestre('Quinto Semestre')
semester6 = verificar_semestre('Sexto Semestre')

extra_materias = [
    ('Primer Semestre', 'Química Básica I'),
    ('Primer Semestre', 'Física Básica I'),
    ('Primer Semestre', 'Inglés I'),
    ('Primer Semestre', 'Socioemocional I'),
    ('Primer Semestre', 'Humanidades I'),
]

for sem_name, mat_name in extra_materias:
    sem_id = {'Primer Semestre': semester1}[sem_name]
    verificar_materia(sem_id, mat_name)

# Reset the unit/question catalog before repopulating it.
conn = Database.get_connection()
cur = conn.cursor()
cur.execute("DELETE FROM resultados")
cur.execute("DELETE FROM preguntas")
cur.execute("DELETE FROM unidades")
conn.commit()
conn.close()

# Ensure the existing 18 materias are present (all semesters) and create 3 units for each.
conn = Database.get_connection()
cur = conn.cursor(dictionary=True)
cur.execute("SELECT id_materia, id_semestre, nombre FROM materias")
rows = cur.fetchall()
conn.close()

for row in rows:
    mid = row['id_materia']
    conn = Database.get_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT COUNT(*) AS c FROM unidades WHERE id_materia=%s", (mid,))
    count = cur.fetchone()['c']
    conn.close()

    if count == 0:
        needed = [1, 2, 3]
    elif count == 1:
        needed = [2, 3]
    elif count == 2:
        needed = [3]
    else:
        needed = []

    for i in needed:
        verificar_unidad(mid, f'Unidad {i} - Nivel {i}')


conn = Database.get_connection()
cur = conn.cursor(dictionary=True)
cur.execute("SELECT u.id_unidad, u.nombre AS unidad, m.nombre AS materia FROM unidades u JOIN materias m ON m.id_materia=u.id_materia")
unidad = cur.fetchall()
conn.close()


preguntas= {
    'Pensamiento Matemático': [
        ('¿Cuál es el resultado de 8 + 7?', ['15', '14', '16', '13'], 'A'),
        ('¿Qué operación sirve para repartir en partes iguales?', ['Suma', 'Resta', 'Multiplicación', 'División'], 'D'),
        ('¿Cuál es el valor de 12 - 5?', ['6', '7', '8', '9'], 'B'),
        ('¿Qué número sigue después de 19?', ['18', '20', '21', '22'], 'B'),
        ('¿Cuál es el doble de 6?', ['10', '12', '14', '16'], 'B'),
        ('¿Qué fracción representa la mitad?', ['1/2', '1/3', '2/3', '3/4'], 'A'),
        ('¿Cuál es el perímetro de un cuadrado de lado 4?', ['12', '14', '16', '18'], 'C'),
        ('¿Qué número es mayor, 15 o 21?', ['15', '21', 'Ambos', 'Ninguno'], 'B'),
        ('¿Cuál es la suma de 9 y 8?', ['15', '16', '17', '18'], 'C'),
        ('¿Qué unidad se usa para medir el espacio ocupado por una figura?', ['Longitud', 'Área', 'Volumen', 'Tiempo'], 'B')
    ],
    'Lengua y Comunicación': [
        ('¿Qué tipo de palabra describe a un sustantivo?', ['Verbo', 'Adjetivo', 'Adverbio', 'Pronombre'], 'B'),
        ('¿Cuál es el propósito de un párrafo?', ['Explicar una idea', 'Desordenar el texto', 'Cambiar el tema', 'Borrar información'], 'A'),
        ('¿Qué signo se usa para terminar una pregunta?', ['.', ',', ';', '?'], 'D'),
        ('¿Qué es una oración?', ['Una lista de números', 'Una idea completa', 'Un dibujo', 'Un título'], 'B'),
        ('¿Cuál es el antónimo de "rápido"?', ['Lento', 'Alto', 'Suave', 'Feliz'], 'A'),
        ('¿Qué palabra es un verbo?', ['Casa', 'Correr', 'Azul', 'Rápido'], 'B'),
        ('¿Cuál es el sujeto de la oración “Ana estudia”?', ['Ana', 'estudia', 'la', 'una'], 'A'),
        ('¿Qué recurso se usa para comparar dos cosas?', ['Hipérbole', 'Símil', 'Metáfora', 'Resumen'], 'B'),
        ('¿Qué parte de la oración indica acción?', ['Sujeto', 'Verbo', 'Artículo', 'Adjetivo'], 'B'),
        ('¿Qué palabra completa “La niña ___ feliz”?', ['está', 'correr', 'libro', 'rápido'], 'A')
    ],
    'Cultura Digital': [
        ('¿Qué debes hacer para proteger tu contraseña?', ['Compartirla con amigos', 'Usar una contraseña segura', 'Escribirla en papel', 'Usar la misma siempre'], 'B'),
        ('¿Qué significa “phishing”?', ['Un juego', 'Un tipo de fraude online', 'Una red social', 'Un antivirus'], 'B'),
        ('¿Qué herramienta sirve para buscar información?', ['Buscador', 'Calculadora', 'Impresora', 'Reproductor'], 'A'),
        ('¿Qué es una red social?', ['Una red de agua', 'Una plataforma para comunicarse', 'Una copia de seguridad', 'Un programa de música'], 'B'),
        ('¿Cuál es una buena práctica al usar internet?', ['Compartir datos personales sin revisar', 'Usar contraseñas únicas', 'Abrir todo lo que llega', 'Descargar archivos sospechosos'], 'B'),
        ('¿Qué debes hacer si recibes un archivo sospechoso?', ['Abrirlo de inmediato', 'Eliminarlo y avisar', 'Compartirlo con todos', 'Guardarlo en la carpeta de Descargas'], 'B'),
        ('¿Qué es un antivirus?', ['Un programa para proteger tu equipo', 'Una impresora', 'Una app de edición', 'Una red inalámbrica'], 'A'),
        ('¿Qué significa “ciberacoso”?', ['Una broma amistosa', 'Acoso mediante internet', 'Un software de audio', 'Una búsqueda en línea'], 'B'),
        ('¿Qué debes verificar antes de compartir datos personales?', ['Que sea divertido', 'Que sea confiable y necesario', 'Que sea gratis', 'Que sea largo'], 'B'),
        ('¿Qué acción evita el acceso no autorizado a tu cuenta?', ['Usar una contraseña fuerte', 'Compartirla con todos', 'Escribirla en la pantalla', 'No cerrar sesión'], 'A')
    ],
    'Química Básica': [
        ('¿Qué es una mezcla?', ['Una sustancia pura', 'Una combinación de sustancias', 'Un solo elemento', 'Una reacción nuclear'], 'B'),
        ('¿Cuál es el símbolo del agua?', ['O', 'H2O', 'CO2', 'NaCl'], 'B'),
        ('¿Qué estado de la materia tiene forma fija?', ['Gas', 'Líquido', 'Sólido', 'Plasma'], 'C'),
        ('¿Qué se mide con la escala de pH?', ['La temperatura', 'La acidez o alcalinidad', 'La masa', 'La velocidad'], 'B'),
        ('¿Qué es un elemento?', ['Una mezcla de dos cosas', 'Una sustancia simple', 'Un cambio químico', 'Un gas'], 'B'),
        ('¿Qué nombre recibe la sustancia más simple?', ['Compuesto', 'Elemento', 'Solución', 'Mezcla'], 'B'),
        ('¿Qué gas respiramos?', ['Oxígeno', 'Dióxido de carbono', 'Helio', 'Nitrógeno'], 'A'),
        ('¿Qué propiedad distingue un sólido de un líquido?', ['Color', 'Forma fija', 'Olor', 'Peso'], 'B'),
        ('¿Qué se obtiene al mezclar sal y agua?', ['Una solución', 'Un gas', 'Un sólido puro', 'Un metal'], 'A'),
        ('¿Qué tipo de cambio ocurre si se quema papel?', ['Físico', 'Químico', 'Biológico', 'Eléctrico'], 'B')
    ],
    'Física Básica': [
        ('¿Qué mide un termómetro?', ['La temperatura', 'La masa', 'La velocidad', 'La presión'], 'A'),
        ('¿Qué se necesita para mover un objeto?', ['Fuerza', 'Silencio', 'Color', 'Luz'], 'A'),
        ('¿Qué es la fuerza?', ['Un empuje o tracción', 'Un color', 'Una forma', 'Una pregunta'], 'A'),
        ('¿Qué unidad se usa para medir la longitud?', ['Metro', 'Segundo', 'Kilogramo', 'Litro'], 'A'),
        ('¿Qué pasa con la energía al caer un objeto?', ['Se transforma', 'Se destruye', 'Se vuelve luz fija', 'Desaparece'], 'A'),
        ('¿Qué es la velocidad?', ['La distancia recorrida en un tiempo', 'La masa de un objeto', 'La cantidad de calor', 'La forma de una figura'], 'A'),
        ('¿Qué tipo de energía tiene un cuerpo en movimiento?', ['Energía cinética', 'Energía térmica', 'Energía química', 'Energía nuclear'], 'A'),
        ('¿Qué instrumento mide la masa?', ['Balanza', 'Termómetro', 'Cronómetro', 'Vernier'], 'A'),
        ('¿Qué sucede cuando dos fuerzas opuestas son iguales?', ['No hay movimiento', 'Se acelera', 'Se quema', 'Se evapora'], 'A'),
        ('¿Qué es la temperatura?', ['La medida del calor de un cuerpo', 'La cantidad de agua', 'La velocidad del sonido', 'La presión del aire'], 'A')
    ],
    'Inglés': [
        ('What is the English word for “libro”?', ['Book', 'Table', 'Pen', 'Car'], 'A'),
        ('What is the plural of “child”?', ['Childs', 'Children', 'Childes', 'Childer'], 'B'),
        ('Which word means “good morning”?', ['Good evening', 'Good morning', 'Good afternoon', 'Good night'], 'B'),
        ('What is the correct form of “to be” for “I”?', ['I am', 'I is', 'I are', 'I be'], 'A'),
        ('What color is the sky on a clear day?', ['Red', 'Blue', 'Green', 'Yellow'], 'B'),
        ('Which sentence is correct?', ['She is happy', 'She am happy', 'She are happy', 'She be happy'], 'A'),
        ('What does “hello” mean in Spanish?', ['Adiós', 'Hola', 'Gracias', 'Por favor'], 'B'),
        ('What is the opposite of “big”?', ['Small', 'Tall', 'Heavy', 'Fast'], 'A'),
        ('Which word fits: “I ___ a student.”', ['am', 'is', 'are', 'be'], 'A'),
        ('What is the past tense of “go”?', ['Went', 'Goed', 'Gone', 'Going'], 'A')
    ],
    'Socioemocional': [
        ('¿Qué ayuda a resolver conflictos con respeto?', ['Escuchar y dialogar', 'Gritar', 'Ignorar', 'Humillar'], 'A'),
        ('¿Qué significa empatía?', ['Entender cómo se siente otra persona', 'No hablar', 'Estar enojado', 'Jugar solo'], 'A'),
        ('¿Por qué es importante escuchar a los demás?', ['Porque mejora la comunicación', 'Porque se pierde tiempo', 'Porque no importa', 'Porque todo es igual'], 'A'),
        ('¿Qué debes hacer cuando alguien se siente triste?', ['Acompañarlo y escuchar', 'Reírte', 'Ignorarlo', 'Gritarle'], 'A'),
        ('¿Qué habilidad mejora la convivencia?', ['La escucha activa', 'La agresividad', 'La indiferencia', 'La mentira'], 'A'),
        ('¿Cómo se llama la capacidad de controlar tus emociones?', ['Autorregulación', 'Desorden', 'Agresión', 'Falta de sueño'], 'A'),
        ('¿Qué acción promueve la responsabilidad?', ['Cumplir con lo que se promete', 'Postergar todo', 'Mentir', 'Ignorar'], 'A'),
        ('¿Por qué es importante pedir ayuda?', ['Porque todos necesitamos apoyo', 'Porque es mala señal', 'Porque nadie ayuda', 'Porque no sirve'], 'A'),
        ('¿Qué actitud ayuda al trabajo en equipo?', ['Colaboración', 'Competencia agresiva', 'Indiferencia', 'Aislamiento'], 'A'),
        ('¿Qué hace una persona autorregulada?', ['Controla sus acciones y emociones', 'Se enoja siempre', 'No escucha', 'Hace todo al azar'], 'A')
    ],
    'Humanidades': [
        ('¿Qué estudia la filosofía?', ['La reflexión sobre la vida y el conocimiento', 'Solo fórmulas matemáticas', 'La historia de los videojuegos', 'La cocina'], 'A'),
        ('¿Qué es una norma?', ['Una regla de convivencia', 'Un deporte', 'Una herramienta digital', 'Una emoción'], 'A'),
        ('¿Qué significa ética?', ['La reflexión sobre lo correcto e incorrecto', 'Una suma matemática', 'Una máquina', 'Una canción'], 'A'),
        ('¿Qué busca la reflexión filosófica?', ['Entender mejor la vida y la razón', 'Comprar más cosas', 'Dormir más', 'Evitar problemas'], 'A'),
        ('¿Qué diferencia hay entre opinión y argumento?', ['La opinión es un punto de vista; el argumento lo sustenta', 'No hay diferencia', 'La opinión siempre es correcta', 'El argumento no usa razones'], 'A'),
        ('¿Qué es el pensamiento crítico?', ['Analizar ideas con razones', 'Copiar sin pensar', 'Inventar historias', 'Decir lo primero que se ocurre'], 'A'),
        ('¿Qué importancia tiene la libertad?', ['Permite decidir responsablemente', 'Impide pensar', 'Solo sirve en la escuela', 'No tiene importancia'], 'A'),
        ('¿Qué es la cultura?', ['El conjunto de costumbres, ideas y valores de un grupo', 'Solo la música', 'Un número', 'Una red social'], 'A'),
        ('¿Por qué se analizan los valores?', ['Para comprender lo que guía nuestras decisiones', 'Porque no importan', 'Porque son números', 'Porque siempre cambian cada minuto'], 'A'),
        ('¿Qué busca la educación humanista?', ['Formar personas reflexivas, éticas y críticas', 'Solo memorizar fechas', 'Evitar leer', 'Solo jugar'], 'A')
    ],
}

porlasdudas = [
    ('¿Qué idea principal se relaciona con este tema?', ['Una explicación clara', 'Una pregunta sin respuesta', 'Una imagen', 'Un número'], 'A'),
    ('¿Cuál opción describe mejor el concepto principal?', ['La opción correcta', 'Una opción falsa', 'Un detalle sin relación', 'Una rima'], 'A'),
    ('¿Qué ejemplo ilustra mejor el tema?', ['Un ejemplo cotidiano', 'Una frase sin sentido', 'Un color', 'Una fecha sin importancia'], 'A'),
    ('¿Qué afirmación es correcta?', ['La afirmación verdadera', 'La afirmación falsa', 'La afirmación confusa', 'La afirmación incompleta'], 'A'),
    ('¿Qué relación existe entre estos conceptos?', ['Una relación lógica', 'Una relación aleatoria', 'Una relación musical', 'Una relación imaginaria'], 'A'),
    ('¿Cuál opción completa mejor la idea?', ['La opción que encaja', 'La opción aleatoria', 'La opción absurda', 'La opción vacía'], 'A'),
    ('¿Qué aplicación práctica corresponde al tema?', ['Una situación real', 'Una frase sin sentido', 'Un dibujo abstracto', 'Una fecha histórica'], 'A'),
    ('¿Qué ventaja ofrece este conocimiento?', ['Una utilidad clara', 'Una confusión', 'Un ruido', 'Una pregunta sin respuesta'], 'A'),
    ('¿Qué error se debe evitar?', ['El error conceptual', 'La respuesta correcta', 'La explicación clara', 'La práctica útil'], 'A'),
    ('¿Cuál es la mejor conclusión?', ['La conclusión más lógica', 'La conclusión absurda', 'La conclusión aleatoria', 'La conclusión vacía'], 'A'),
]

for item in unidad:
    unidad_id = item['id_unidad']
    nombre_materia = item['materia']
    nombre_unidad = item['unidad']
    bank = None
    for key, bank_list in preguntas.items():
        if key.lower() in nombre_materia.lower():
            bank = bank_list
            break
    if bank is None:
        bank = porlasdudas

    indice_unidad = int(nombre_unidad.split(' ')[1]) if nombre_unidad.startswith('Unidad ') else 1
    for idx, (prompt, opcion, correcta) in enumerate(bank):
        if indice_unidad == 1:
            prompt_final = f"{prompt} (nivel básico)"
        elif indice_unidad == 2:
            prompt_final = f"{prompt} (nivel intermedio)"
        else:
            prompt_final = f"{prompt} (nivel avanzado)"
        insertar_pregunta(unidad_id, prompt_final, opcion[0], opcion[1], opcion[2], opcion[3], correcta)

print('Catalogo y preguntas generadas correctamente.')
