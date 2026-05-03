import flet as ft

def ExamenView(page, exam_ctrl, id_unidad):
    #cargamos las preguntas de la unidad seleccionada
    preguntas = exam_ctrl.obtener_examen(id_unidad)
    estado = {"indice": 0, "puntos": 0}

    txt_pregunta = ft.Text(size=22, weight="bold", text_align=ft.TextAlign.CENTER)
    opciones = ft.RadioGroup(content=ft.Column([]))

    def mostrar_pregunta():
        if estado["indice"] < len(preguntas):
            p = preguntas[estado["indice"]]
            txt_pregunta.value = p['pregunta_texto']
            opciones.content.controls = [
                ft.Radio(value="A", label=p['opcion_a']),
                ft.Radio(value="B", label=p['opcion_b']),
                ft.Radio(value="C", label=p['opcion_c']),
                ft.Radio(value="D", label=p['opcion_d']),
            ]
            opciones.value = None # Resetea la selección
            page.update()
        else:
            finalizar_examen()

    def finalizar_examen():
        page.views.append(ft.View(
            route="/resultado",
            controls=[
                ft.Text("Resultado Final", size=40, weight="bold"),
                ft.Text(f"Aciertos: {estado['puntos']} de {len(preguntas)}", size=25),
                ft.ElevatedButton("Regresar al Menú", on_click=lambda _: page.go("/menu"))
            ],
            vertical_alignment=ft.MainAxisAlignment.CENTER,
            horizontal_alignment=ft.CrossAxisAlignment.CENTER
        ))
        page.update()

    def siguiente_pregunta(e):
        if not opciones.value: return # no avanzar sin responder
        
        # verificar respuesta correcta
        if opciones.value == preguntas[estado["indice"]]['respuesta_correcta']:
            estado["puntos"] += 1
            
        estado["indice"] += 1
        mostrar_pregunta()

    if preguntas:
        mostrar_pregunta()
    else:
        txt_pregunta.value = "No se encontraron preguntas para esta unidad."
        opciones.content.controls = []

    return ft.View(
        route="/examen",
        controls=[
            ft.AppBar(title=ft.Text("Examen en curso"), bgcolor="orange"),
            ft.Container(
                content=ft.Column([
                    ft.ProgressBar(value=0, width=400, color="blue"), 
                    txt_pregunta,
                    ft.Divider(),
                    opciones,
                    ft.ElevatedButton("Siguiente Pregunta", on_click=siguiente_pregunta, width=200)
                ], horizontal_alignment=ft.CrossAxisAlignment.CENTER),
                padding=30
            )
        ]
    )