import flet as ft


def PerfilView(page, exam_ctrl):
    current_user = getattr(page, "current_user", None)
    resultados_por_materia = []

    if current_user:
        resultados_por_materia = exam_ctrl.obtener_resultados_por_materia(current_user['id_usuario'])

    def logout(e):
        page.current_user = None
        page.go("/login")

    def volver_menu(e):
        page.go("/menu")

    return ft.View(
        route="/perfil",
        bgcolor=ft.Colors.BLUE_GREY_900,
        vertical_alignment=ft.MainAxisAlignment.CENTER,
        horizontal_alignment=ft.CrossAxisAlignment.CENTER,
        controls=[
            ft.Container(
                content=ft.Column([
                    ft.Text("Perfil de usuario", size=28, weight="bold", color=ft.Colors.WHITE),
                    ft.Text(f"Nombre: {current_user.get('nombre', 'Desconocido')}", color=ft.Colors.GREY_100),
                    ft.Text(f"Correo: {current_user.get('email', 'Desconocido')}", color=ft.Colors.GREY_100),
                    ft.Divider(color=ft.Colors.BLUE_GREY_700),
                    ft.Text("Progreso por materia", size=18, weight="bold", color=ft.Colors.WHITE),
                    ft.Column([
                        ft.Row([
                            ft.Text(r['materia'], expand=True, color=ft.Colors.GREY_100),
                            ft.Text(f"Promedio: {r['promedio']}%", width=140, text_align=ft.TextAlign.RIGHT, color=ft.Colors.GREEN_200)
                        ])
                        for r in resultados_por_materia
                    ] or [ft.Text("Aún no tienes calificaciones registradas.", color=ft.Colors.GREY_300)]),
                    ft.Divider(color=ft.Colors.BLUE_GREY_700),
                    ft.Row([
                        ft.ElevatedButton("Volver al menú", on_click=volver_menu, bgcolor=ft.Colors.BLUE_700, color=ft.Colors.WHITE),
                        ft.ElevatedButton("Cerrar sesión", on_click=logout, bgcolor=ft.Colors.RED_700, color=ft.Colors.WHITE),
                    ], alignment=ft.MainAxisAlignment.CENTER)
                ], spacing=10, horizontal_alignment=ft.CrossAxisAlignment.CENTER),
                width=380,
                padding=20,
                border_radius=18,
                bgcolor=ft.Colors.BLUE_GREY_800,
            )
        ],
    )
