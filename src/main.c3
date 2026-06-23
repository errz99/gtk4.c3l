module main;

import std::io;
import gtk4;
import glib;

const APP_ID = "com.github.louis77.c3-gtk";

fn void click_cb(Button* btn, Window* win) {
	Window.destroy(win);
}

fn void app_activate(GtkApplication* app, Pointer user_data) {
	Window* win = gtk4::window_new(TOP_LEVEL);
	Window.set_application(win, app);
	Window.set_title(win, "GTK4 from C3");
	Window.set_default_size(win, 400, 300);

	Box* box = gtk4::box_new(ORIENTATION_VERTICAL, 5);
	Box.set_homogeneous(box, true);

	Label* lab  = gtk4::label_new("Hello from C3 😃");
	Button* btn = gtk4::button_new_with_label("Click me");
	glib::signal_connect((Pointer)btn, (CharPtr)"clicked", (Callback)&click_cb, (Pointer)win);

	gtk4::Box.append(box, (Widget*)lab);
	gtk4::Box.append(box, (Widget*)btn);

	gtk4::Window.set_child(win, (Widget*)box);
	gtk4::Window.present(win);
}

fn int main(int argc, char** argv) {
	GtkApplication* app = gtk4::application_new(APP_ID, APPLICATION_DEFAULT_FLAGS);
	glib::signal_connect((Pointer)app, (CharPtr)"activate", (Callback)&app_activate, (Pointer)0);
	CInt stat = glib::GApplication.run((GApplication*)app, argc, argv);
	glib::object_unref((Pointer)app);
	return (int)stat;
}
