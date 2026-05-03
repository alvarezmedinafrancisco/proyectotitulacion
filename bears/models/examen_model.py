from .database_model import Database

class ExamenModel:
    def __init__(self):
        self.db = Database()

    def obtener_all_semestres(self):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM semestres")
        res = cursor.fetchall()
        conn.close()
        return res

    def obtener_materias_por_semestre(self, id_semestre):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM materias WHERE id_semestre = %s", (id_semestre,))
        res = cursor.fetchall()
        conn.close()
        return res

    def obtener_preguntas_unidad(self, id_unidad):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        # Traemos las preguntas al azar para que el examen no sea siempre igual
        cursor.execute("SELECT * FROM preguntas WHERE id_unidad = %s ORDER BY RAND()", (id_unidad,))
        res = cursor.fetchall()
        conn.close()
        return res

    def obtener_unidades_por_materia(self, id_materia):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM unidades WHERE id_materia = %s", (id_materia,))
        res = cursor.fetchall()
        conn.close()
        return res