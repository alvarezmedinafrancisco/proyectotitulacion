import flet as ft

def MenuView(page, examen_controller):
    semestres = examen_controller.listar_semestres()
    current_user = getattr(page, "current_user", None)
    user_name = current_user.get("nombre", "") if current_user else ""
    resultados = []

    if current_user:
        resultados = examen_controller.obtener_resultados_usuario(current_user["id_usuario"])

    container_materias = ft.Column(spacing=10)
    resultados_column = ft.Column(spacing=10)

    def logout(e):
        page.current_user = None
        page.dialog.open = False
        page.go("/login")

    def volver_login(e):
        page.go("/login")

    def close_profile(e):
        page.close(perfil_dialog)
        page.update()

    def open_profile(e):
        page.go("/perfil")

    def cargar_unidades(id_materia):
        container_materias.controls.clear()
        unidades = examen_controller.listar_unidades(id_materia)
        if unidades:
            for u in unidades:
                container_materias.controls.append(
                    ft.ElevatedButton(
                        content=u['nombre'],
                        width=300,
                        on_click=lambda _, id_u=u['id_unidad']: page.go(f"/examen/{id_u}")
                    )
                )
        else:
            container_materias.controls.append(ft.Text("No hay unidades registradas para esta materia.", size=16))
        page.update()

    def cargar_materias(id_semestre):
        container_materias.controls.clear()
        materias = examen_controller.listar_materias(id_semestre)
        if materias:
            for m in materias:
                container_materias.controls.append(
                    ft.ElevatedButton(
                        content=m['nombre'],
                        width=300,
                        on_click=lambda _, id_m=m['id_materia']: cargar_unidades(id_m)
                    )
                )
        else:
            container_materias.controls.append(ft.Text("No hay materias para este semestre.", size=16))
        page.update()

    # generamos botones de semestre dinámicamente
    botones_semestres = []
    for s in semestres:
        botones_semestres.append(
            ft.TextButton(content=s['nombre'], on_click=lambda _, id_s=s['id_semestre']: cargar_materias(id_s))
        )
        
    if resultados:
        for r in resultados:
            try:
                calificacion = float(r['calificacion'])
            except (ValueError, TypeError):
                calificacion = 0

            if calificacion <= 50:
                color_calif = ft.Colors.RED_700
                mensaje = "Debes practicar más sobre el tema. Vuelve cuando estés listo, te estaré esperando."
            elif calificacion < 70:
                color_calif = ft.Colors.AMBER_900
                mensaje = "Si esto fuera un examen real lo pasas de milagro. Tú decides: estudias más y mejoras la nota o lo dejas así."
            else:
                color_calif = ft.Colors.GREEN_700
                mensaje = "¡Felicidades! Casi eres un experto, pero sigue practicando. Espero haberte ayudado."

            resultados_column.controls.append(
                ft.Container(
                    content=ft.Column([
                        ft.Text(f"{r['materia']} - {r['unidad']}", weight="bold", color=ft.Colors.BLACK87, size=16),
                        ft.Text(f"Calificación: {r['calificacion']}%", weight="bold", color=color_calif, size=15),
                        ft.Text(mensaje, color=ft.Colors.BLACK87, size=13, italic=True),
                        ft.Text(f"Realizado: {r['fecha_realizacion']}", size=12, color=ft.Colors.BLACK54)
                    ], spacing=4),
                    padding=15,
                    bgcolor=ft.Colors.BLUE_50,
                    border_radius=10,
                    width=600 
                )
            )
    else:
        resultados_column.controls.append(ft.Text("No hay resultados recientes registrados.", size=14, color=ft.Colors.BLACK54))

    resultados_por_materia = []
    if getattr(page, "current_user", None):
        resultados_por_materia = examen_controller.obtener_resultados_por_materia(page.current_user['id_usuario'])

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
        route="/menu",
        bgcolor=ft.Colors.BLUE_GREY_900,
        controls=[
            ft.AppBar(
                title=ft.Text("Guías CETIS 61", color=ft.Colors.WHITE),
                bgcolor=ft.Colors.BLUE_GREY_800,
                color=ft.Colors.WHITE,
                leading=ft.IconButton(icon=ft.Icons.ARROW_BACK, tooltip="Volver al login", on_click=volver_login),
                actions=[
                    ft.IconButton(icon=ft.Icons.PERSON, tooltip="Perfil", on_click=open_profile)
                ]
            ),
            ft.Text(f"¡Bienvenido, {user_name}!", size=22, weight="bold", color=ft.Colors.BLUE_200),
            ft.Divider(color=ft.Colors.BLUE_GREY_700),
            ft.Text("Selecciona tu semestre:", size=20, weight="bold", color=ft.Colors.WHITE),
            ft.Row(botones_semestres, scroll=ft.ScrollMode.ALWAYS),
            ft.Divider(color=ft.Colors.BLUE_GREY_700),
            ft.Text("Materias disponibles:", size=18, color=ft.Colors.WHITE),
            container_materias,
            ft.Divider(color=ft.Colors.BLUE_GREY_700),
            ft.Text("Resultados recientes:", size=18, weight="bold", color=ft.Colors.WHITE),
            resultados_column,
            ft.Divider(color=ft.Colors.BLUE_GREY_700),
        ],
        padding=20,
        scroll=ft.ScrollMode.AUTO
    )