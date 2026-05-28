module gtk4;

import glib;

typedef Widget = void*;
typedef Button = void*;
typedef Window = void*;
typedef Box = void*;

enum Orientation : CInt
{
  ORIENTATION_HORIZONTAL,
  ORIENTATION_VERTICAL
}

extern fn Application *     application_new (ZString application_id, glib::ApplicationFlags flags) @cname("gtk_application_new");

extern fn Widget*           window_new () @cname("gtk_window_new");
extern fn void              window_set_application (Window *window, Application *application) @cname("gtk_window_set_application");
extern fn void              window_present (Window *window) @cname("gtk_window_present");
extern fn void              window_set_title (Window *window, ZString title) @cname("gtk_window_set_title");
extern fn void              window_set_default_size (Window *window, CInt width, CInt height) @cname("gtk_window_set_default_size");
extern fn void              window_set_child (Window *window, Widget *child) @cname("gtk_window_set_child");
extern fn void              window_destroy (Window *window) @cname("gtk_window_destroy");

extern fn Widget*           label_new (ZString str) @cname("gtk_label_new");

extern fn Widget*           button_new_with_label (ZString label) @cname("gtk_button_new_with_label");

extern fn Widget*           box_new (Orientation orientation, CInt spacing) @cname("gtk_box_new");
extern fn void              box_set_homogeneous (Box *box, bool homogeneous) @cname("gtk_box_set_homogeneous");
extern fn void              box_append (Box *box, Widget *child) @cname("gtk_box_append");