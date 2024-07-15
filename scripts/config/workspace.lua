
root = "../../"
output_binaries = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

-- The workspace refers to the vs-solution name
workspace "Workspace Name Here"
    location (root)
    architecture "x64"
    configurations {
        "debug",
        "release",
        "dist",
    }
    startproject "production"

include "dependencies.lua"

include "../projects/setup-testing.lua"
include "../projects/setup-production.lua"

group "core"
    include "../projects/setup-core.lua"