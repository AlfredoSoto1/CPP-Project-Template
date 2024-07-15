-- Define project
project "core"
    location (root.. "/projects/%{prj.name}")
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"

    -- Output directories for object files and binaries
    objdir    (root.. "bin/intermediates/" .. output_binaries .. "/%{prj.name}")
    targetdir (root.. "bin/"               .. output_binaries .. "/%{prj.name}")

    -- Source files to include in the project
    files {
        root.. "projects/%{prj.name}/src/**.c",
        root.. "projects/%{prj.name}/src/**.h",
        root.. "projects/%{prj.name}/src/**.hpp",
        root.. "projects/%{prj.name}/src/**.cpp",
        root.. "projects/%{prj.name}/src/**.ixx",
        root.. "projects/%{prj.name}/src/**.cppm",
        root.. "projects/%{prj.name}/src/**.glsl",
    }

    -- Include directories
    includedirs {
        root.. "projects/%{prj.name}/src",
    }

    -- Lib directories
    libdirs {}
    -- Linking with
    links {}
    -- Project define-specific
    defines {}

    -- Set default platform-specific configuration
    filter "system:windows"
        systemversion "latest"
        -- staticruntime "default"
        defines {"PLATFORM_WINDOWS"}
        
    filter "system:linux"
        toolset "gcc"
        defines { "PLATFORM_LINUX" }

    -- Set default build configurations
    include "build.lua"