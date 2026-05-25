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
    def obtener_resultados_por_usuario(self, id_usuario):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT r.calificacion, r.fecha_realizacion, u.nombre AS unidad, m.nombre AS materia "
            "FROM resultados r "
            "JOIN unidades u ON r.id_unidad = u.id_unidad "
            "JOIN materias m ON u.id_materia = m.id_materia "
            "WHERE r.id_usuario = %s "
            "ORDER BY r.fecha_realizacion DESC LIMIT 5",
            (id_usuario,)
        )
        res = cursor.fetchall()
        conn.close()
        return res

    def guardar_resultado(self, id_usuario, id_unidad, calificacion):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO resultados (id_usuario, id_unidad, calificacion) VALUES (%s, %s, %s)",
                (id_usuario, id_unidad, calificacion)
            )
            conn.commit()
            return True
        except Exception as e:
            print(f"Error al guardar resultado: {e}")
            return False
        finally:
            conn.close()

    def obtener_unidad_y_materia(self, id_unidad):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT u.nombre AS unidad, m.nombre AS materia "
            "FROM unidades u "
            "JOIN materias m ON u.id_materia = m.id_materia "
            "WHERE u.id_unidad = %s",
            (id_unidad,)
        )
        res = cursor.fetchone()
        conn.close()
        return res

    def obtener_resultados_por_usuario_por_materia(self, id_usuario):
        conn = self.db.get_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute(
            "SELECT m.nombre AS materia, COUNT(*) AS intentos, ROUND(AVG(r.calificacion), 2) AS promedio, "
            "MAX(r.calificacion) AS mejor_calificacion, MIN(r.calificacion) AS peor_calificacion "
            "FROM resultados r "
            "JOIN unidades u ON r.id_unidad = u.id_unidad "
            "JOIN materias m ON u.id_materia = m.id_materia "
            "WHERE r.id_usuario = %s "
            "GROUP BY m.id_materia, m.nombre "
            "ORDER BY m.nombre",
            (id_usuario,)
        )
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