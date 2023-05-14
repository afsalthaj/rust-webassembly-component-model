// src/lib.rs

// Use a procedural macro to generate bindings for the world we specified in
// `host.wit`
wit_bindgen::generate!("host");

// Define a custom type and implement the generated `Host` trait for it which
// represents implementing all the necesssary exported interfaces for this
// component.
struct HostDefaultImpl;

impl Host for HostDefaultImpl {
    fn run() {
        print("Hello, world!");
    }
}

export_host!(HostDefaultImpl);
