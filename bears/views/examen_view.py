import flet as ft

def ExamenView(page, exam_ctrl, id_unidad):
    # cargamos las preguntas de la unidad seleccionada
    preguntas = exam_ctrl.obtener_examen(id_unidad)
    datos_unidad = exam_ctrl.obtener_unidad_y_materia(id_unidad) or {"unidad": "Desconocida", "materia": "Desconocida"}
    estado = {"indice": 0, "puntos": 0}

    txt_pregunta = ft.Text(size=22, weight="bold", text_align=ft.TextAlign.CENTER, color=ft.Colors.WHITE)
    opciones = ft.RadioGroup(content=ft.Column([], spacing=8))

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
        if getattr(page, "current_user", None):
            porcentaje = round((estado['puntos'] / len(preguntas)) * 100, 2) if preguntas else 0
            exam_ctrl.guardar_resultado(page.current_user['id_usuario'], id_unidad, porcentaje)

        resultado_usuario = page.current_user if getattr(page, "current_user", None) else {}
        page.views.append(ft.View(
            route="/resultado",
            bgcolor=ft.Colors.BLUE_GREY_900,
            controls=[
                ft.Text("Resultado Final", size=40, weight="bold", color=ft.Colors.WHITE),
                ft.Text(f"Alumno: {resultado_usuario.get('nombre', 'Invitado')}", size=18, color=ft.Colors.GREY_200),
                ft.Text(f"Correo: {resultado_usuario.get('email', 'No disponible')}", size=14, color=ft.Colors.GREY_300),
                ft.Divider(color=ft.Colors.BLUE_GREY_700),
                ft.Text(f"Materia: {datos_unidad.get('materia', 'Desconocida')}", size=16, color=ft.Colors.GREY_100),
                ft.Text(f"Unidad: {datos_unidad.get('unidad', 'Desconocida')}", size=16, color=ft.Colors.GREY_100),
                ft.Divider(color=ft.Colors.BLUE_GREY_700),
                ft.Text(f"Aciertos: {estado['puntos']} de {len(preguntas)}", size=25, color=ft.Colors.WHITE),
                ft.Text(f"Puntaje: {round((estado['puntos'] / len(preguntas)) * 100, 2) if preguntas else 0}%", size=18, color=ft.Colors.GREEN_200),
                ft.ElevatedButton("Regresar al Menú", on_click=lambda _: page.go("/menu"), width=200, bgcolor=ft.Colors.BLUE_700, color=ft.Colors.WHITE)
            ],
            vertical_alignment=ft.MainAxisAlignment.CENTER,
            horizontal_alignment=ft.CrossAxisAlignment.CENTER
        ))
        page.update()

    def logout(e):
        page.current_user = None
        page.dialog.open = False
        page.go("/login")

    def close_profile(e):
        page.close(perfil_dialog)
        page.update()

    def open_profile(e):
        page.go("/perfil")

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
        txt_pregunta.value = "No se encontraron preguntas para esta unidad. Agrega filas en la tabla preguntas de la base de datos para esta unidad."
        opciones.content.controls = []

    resultados_por_materia = []
    if getattr(page, "current_user", None):
        resultados_por_materia = exam_ctrl.obtener_resultados_por_materia(page.current_user['id_usuario'])

    perfil_dialog = ft.AlertDialog(
        title=ft.Text("Perfil de usuario", weight="bold", color=ft.Colors.WHITE),
        content=ft.Container(
            content=ft.Column([
                ft.Text(f"Correo: {page.current_user['email']}" if getattr(page, "current_user", None) else "Correo: Desconocido", color=ft.Colors.GREY_100),
                ft.Text(f"Nombre: {page.current_user.get('nombre', '')}" if getattr(page, "current_user", None) else "Nombre: Desconocido", color=ft.Colors.GREY_100),
                ft.Divider(thickness=1, color=ft.Colors.BLUE_GREY_700),
                ft.Text("Progreso por materia:", weight="bold", color=ft.Colors.WHITE),
                ft.Column([
                    ft.Row([
                        ft.Text(r['materia'], expand=True),
                        ft.Text(f"Promedio: {r['promedio']}%", width=140, text_align=ft.TextAlign.RIGHT)
                    ])
                    for r in resultados_por_materia
                ] or [ft.Text("Aún no tienes calificaciones registradas.")]),
                ft.Divider(thickness=1, color=ft.Colors.BLUE_200),
                ft.ElevatedButton("Cerrar sesión", on_click=logout, width=200, bgcolor=ft.Colors.RED, color="white")
            ], spacing=10),
            padding=20,
            bgcolor=ft.Colors.BLUE_50,
            border_radius=20
        ),
        actions=[
            ft.TextButton("Cerrar", on_click=close_profile)
        ],
        shape=ft.RoundedRectangleBorder(radius=20)
    )

    page.dialog = perfil_dialog

    return ft.View(
        route="/examen",
        bgcolor=ft.Colors.BLUE_GREY_900,
        controls=[
            ft.AppBar(
                title=ft.Text("Examen en curso", color=ft.Colors.WHITE),
                bgcolor=ft.Colors.BLUE_GREY_800,
                leading=ft.IconButton(icon=ft.Icons.ARROW_BACK, tooltip="Volver al menú", on_click=lambda e: page.go("/menu")),
                actions=[
                    ft.IconButton(icon=ft.Icons.PERSON, tooltip="Perfil", on_click=open_profile)
                ]
            ),
            ft.Container(
                content=ft.Column([
                    ft.Row([
                        ft.Text(f"{datos_unidad['materia']} - {datos_unidad['unidad']}", size=16, weight="bold", color=ft.Colors.WHITE),
                        ft.ElevatedButton("Ver perfil", on_click=open_profile, bgcolor=ft.Colors.BLUE_700, color=ft.Colors.WHITE, width=120)
                    ], alignment=ft.MainAxisAlignment.SPACE_BETWEEN),
                    ft.Divider(color=ft.Colors.BLUE_GREY_700),
                    ft.ProgressBar(value=0, width=400, color=ft.Colors.BLUE_300),
                    txt_pregunta,
                    ft.Divider(color=ft.Colors.BLUE_GREY_700),
                    opciones,
                    ft.ElevatedButton("Siguiente Pregunta", on_click=siguiente_pregunta, width=220, bgcolor=ft.Colors.GREEN_700, color=ft.Colors.WHITE),
                    ft.TextButton("Volver al inicio", on_click=lambda e: page.go("/menu"), style=ft.ButtonStyle(color=ft.Colors.BLUE_100))
                ], horizontal_alignment=ft.CrossAxisAlignment.CENTER, spacing=12),
                padding=30,
                bgcolor=ft.Colors.BLUE_GREY_900
            )
        ]
    )