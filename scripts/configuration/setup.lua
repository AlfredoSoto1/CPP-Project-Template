
root = "../../"
output_binaries = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

-- The workspace can also refer to the vs-solution name
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

include "setup-testing.lua"
include "setup-production.lua"

group "core"
    include "setup-core.lua"