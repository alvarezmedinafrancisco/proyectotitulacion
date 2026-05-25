from ..models.examen_model import ExamenModel

class ExamenController:
    def __init__(self):
        self.model = ExamenModel()
    
    def listar_semestres(self):
        return self.model.obtener_all_semestres()
    
    def listar_materias(self, id_semestre):
        return self.model.obtener_materias_por_semestre(id_semestre)

    def listar_unidades(self, id_materia):
        return self.model.obtener_unidades_por_materia(id_materia)

    def obtener_examen(self, id_unidad):
        return self.model.obtener_preguntas_unidad(id_unidad)

    def obtener_resultados_usuario(self, id_usuario):
        return self.model.obtener_resultados_por_usuario(id_usuario)

    def obtener_resultados_por_materia(self, id_usuario):
        return self.model.obtener_resultados_por_usuario_por_materia(id_usuario)

    def obtener_unidad_y_materia(self, id_unidad):
        return self.model.obtener_unidad_y_materia(id_unidad)

    def guardar_resultado(self, id_usuario, id_unidad, calificacion):
        return self.model.guardar_resultado(id_usuario, id_unidad, calificacion)