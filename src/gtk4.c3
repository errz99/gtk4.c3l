module gtk4;

import glib;

struct GtkApplication {
	inline Pointer parent;
}
struct Window {
	inline Pointer parent;
}
struct Widget {
	inline Pointer parent;
}
struct Button {
	inline Pointer parent;
}
struct Label {
	inline Pointer parent;
}
struct Box {
	inline Pointer parent;
}

enum WindowType {
	TOP_LEVEL,
	POPUP,
}

enum Orientation {
	ORIENTATION_HORIZONTAL,
	ORIENTATION_VERTICAL
}

extern fn GtkApplication* application_new(
	ZString application_id,
	glib::ApplicationFlags flags
) @cname("gtk_application_new");

// GtkWindow
extern fn Window* window_new(WindowType type) @cname("gtk_window_new");
extern fn void Window.close(Window* this) @cname("gtk_window_close");
extern fn void Window.destroy(Window* this) @cname("gtk_window_destroy");
extern fn void Window.fullscreen(Window* this) @cname("gtk_window_fullscreen");
extern fn void Window.maximize(Window* this) @cname("gtk_window_maximize");
extern fn void Window.minimize(Window* this) @cname("gtk_window_minimize");
extern fn void Window.unmaximize(Window* this) @cname("gtk_window_unmaximize");
extern fn void Window.unminimize(Window* this) @cname("gtk_window_unminimize");
extern fn void Window.present(Window* this) @cname("gtk_window_present");

extern fn void Window.set_application(Window* this, GtkApplication* application) @cname("gtk_window_set_application");
extern fn void Window.set_title(Window* this, ZString title) @cname("gtk_window_set_title");
extern fn void Window.set_default_size(Window* this, CInt width, CInt height) @cname("gtk_window_set_default_size");
extern fn void Window.set_child(Window* this, Widget* child) @cname("gtk_window_set_child");

extern fn Label* label_new(ZString str) @cname("gtk_label_new");

extern fn Button* button_new_with_label(ZString label) @cname("gtk_button_new_with_label");

extern fn Box* box_new(Orientation orientation, CInt spacing) @cname("gtk_box_new");
extern fn void Box.set_homogeneous(Box* this, bool homogeneous) @cname("gtk_box_set_homogeneous");
extern fn void Box.append(Box* box, Widget* child) @cname("gtk_box_append");
