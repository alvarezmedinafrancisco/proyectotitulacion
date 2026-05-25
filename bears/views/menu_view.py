import flet as ft

def MenuView(page, examen_controller):
    semestres = examen_controller.listar_semestres()
    current_user = getattr(page, "current_user", None)
    user_email = current_user["email"] if current_user else "No identificado"
    user_name = current_user.get("nombre", "") if current_user else ""
    resultados = []

    if current_user:
        resultados = examen_controller.obtener_resultados_usuario(current_user["id_usuario"])

    container_materias = ft.Column(spacing=10)
    resultados_column = ft.Column(spacing=5)

    def logout(e):
        page.current_user = None
        page.go("/login")

    def volver_login(e):
        page.go("/login")

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
            resultados_column.controls.append(
                ft.Container(
                    content=ft.Column([
                        ft.Text(f"{r['materia']} - {r['unidad']}", weight="bold"),
                        ft.Text(f"Calificación: {r['calificacion']}%"),
                        ft.Text(f"Realizado: {r['fecha_realizacion']}", size=12, color=ft.Colors.BLACK54)
                    ]),
                    padding=10,
                    bgcolor=ft.Colors.BLUE_50,
                    border_radius=10
                )
            )
    else:
        resultados_column.controls.append(ft.Text("No hay resultados recientes registrados.", size=14, color=ft.Colors.BLACK54))

    return ft.View(
        route="/menu",
        controls=[
            ft.AppBar(
                title=ft.Text("Guías CETIS 61"),
                bgcolor=ft.Colors.BLUE_800,
                color="white",
                leading=ft.IconButton(icon=ft.Icons.ARROW_BACK, tooltip="Volver al login", on_click=volver_login)
            ),
            ft.Text(f"Usuario: {user_email}", size=14),
            ft.Text(f"Nombre: {user_name}", size=14),
            ft.Divider(),
            ft.Text("Selecciona tu semestre:", size=20, weight="bold"),
            ft.Row(botones_semestres, scroll=ft.ScrollMode.ALWAYS),
            ft.Divider(),
            ft.Text("Materias disponibles:", size=18),
            container_materias,
            ft.Divider(),
            ft.Text("Resultados recientes:", size=18, weight="bold"),
            resultados_column,
            ft.Divider(),
            ft.Text(
                "Para agregar más exámenes y temas, añade nuevas filas en las tablas: semestres, materias, unidades y preguntas.",
                size=14,
                color=ft.Colors.BLACK54
            )
        ],
        padding=20
    )