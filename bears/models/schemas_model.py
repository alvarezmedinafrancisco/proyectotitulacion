from pydantic import BaseModel, EmailStr, Field

class UsuarioSchema(BaseModel):
    # validamos que el nombre tenga entre 3 y 100 caracteres
    nombre: str = Field(..., min_length=3, max_length=100)
    email: EmailStr
    # validamos que la contraseña tenga al menos 8 caracteres para mayor seguridad
    password: str = Field(..., min_length=8)

class PreguntaSchema(BaseModel):
    id_unidad: int
    pregunta_texto: str = Field(..., min_length=5)
    respuesta_correcta: str = Field(..., pattern="^[A-D]$") # Solo A, B, C o D