fn main() {
    println!("cargo:rustc-link-search=native=.");
    println!("cargo:rustc-cdylib-link-arg=-Wl,-rpath,/app/bin/linux64");
    println!("cargo:rustc-cdylib-link-arg=-l:bin/linux64/lua_shared.so");
}
