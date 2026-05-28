module glib;

typedef ApplicationFlags = void*;
typedef Pointer = inline void*;
typedef CharPtr = ZString;
typedef Callback = void*;
typedef ClosureNotify = void*;
typedef ConnectFlags = void*;

struct Application {
	inline Pointer parent;
}

extern fn CInt Application.run(Application* this, CInt argc, char** argv) @cname("g_application_run");
extern fn CULong signal_connect_data(
	Pointer instance,
	CharPtr detailed_signal,
	Callback c_handler,
	Pointer data,
	ClosureNotify destroy_data,
	ConnectFlags connect_flags
) @cname("g_signal_connect_data");
extern fn void object_unref(Pointer object) @cname("g_object_unref");

// C macros

fn CULong signal_connect(
	Pointer instance,
	CharPtr detailed_signal,
	Callback c_handler,
	Pointer data
) @inline => signal_connect_data(instance, detailed_signal, c_handler, data, (ClosureNotify)null, (ConnectFlags)null);