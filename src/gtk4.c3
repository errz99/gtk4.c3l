module gtk4;

import glib;

struct Widget {
	inline Pointer parent;
}
struct Window {
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

enum Orientation {
	ORIENTATION_HORIZONTAL,
	ORIENTATION_VERTICAL
}

extern fn Application* application_new(
	ZString application_id,
	glib::ApplicationFlags flags
) @cname("gtk_application_new");

extern fn Window* window_new() @cname("gtk_window_new");
extern fn void Window.set_application(Window* this, Application* application) @cname("gtk_window_set_application");
extern fn void Window.present(Window* this) @cname("gtk_window_present");
extern fn void Window.set_title(Window* this, ZString title) @cname("gtk_window_set_title");
extern fn void Window.set_default_size(Window* this, CInt width, CInt height) @cname("gtk_window_set_default_size");
extern fn void Window.set_child(Window* this, Widget* child) @cname("gtk_window_set_child");
extern fn void Window.destroy(Window* window) @cname("gtk_window_destroy");

extern fn Label* label_new(ZString str) @cname("gtk_label_new");

extern fn Button* button_new_with_label(ZString label) @cname("gtk_button_new_with_label");

extern fn Box* box_new(Orientation orientation, CInt spacing) @cname("gtk_box_new");
extern fn void Box.set_homogeneous(Box* this, bool homogeneous) @cname("gtk_box_set_homogeneous");
extern fn void Box.append(Box* box, Widget* child) @cname("gtk_box_append");