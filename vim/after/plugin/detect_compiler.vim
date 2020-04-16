" detect make program
if !empty(glob("gradlew"))
    compiler gradlew
elseif !empty(glob("build.gradle"))
    compiler gradle
elseif !empty(glob("pom.xml"))
    compiler mvn
elseif !empty(glob("build.sbt"))
    compiler sbt
elseif !empty(glob("build.xml"))
    compiler ant
elseif !empty(glob("Cargo.toml"))
    compiler cargo
elseif !empty(glob("package.json"))
    set makeprg=npm
elseif has("win32")
    set makeprg=mingw32-make
endif


