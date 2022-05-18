help([[
Description
===========
Load NASM compression library

* https://github.com/netwide-assembler/nasm
]])

local name = "${package}"
local version = "${version}"
local dist = os.getenv("ALCOR_DIST")

local path = pathJoin(dist, name, version)

-- Binary folder
prepend_path("PATH", pathJoin(path, "bin"))

-- Man Pages
prepend_path("MANPATH", pathJoin(path, "share", "man"))
