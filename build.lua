--[[
  ** Build config for maine-thesis using l3build **
--]]

module = "maine-thesis"
pkgversion = "2.0.0"
pkgdate    = "2025-09-05"

-- 1. DEFINE FILES BY THEIR PURPOSE
-- l3build will use these lists to build the package, documentation, and final .zip
maindir        = "."
sourcefiledir = "./sources"
-- Source files for unpacking
sourcefiles   = {"maine-thesis.dtx", "maine-thesis"}

-- The final file(s) for a user's TeX installation
installfiles  = {"maine-thesis.cls"}

-- Source files to be typeset into PDFs for documentation
typesetfiles  = {"maine-thesis.dtx", "maine-thesis-example.tex"}
binaryfiles = {"*.pdf"}

-- Plain text files for the CTAN zip
textfiles     = {"./sources/CTANREADME.md", "MANIFEST.md"}



-- 2. CONFIGURE THE BUILD PROCESS

-- Unpacking configuration (using the .ins file is standard)
unpackfiles = {"maine-thesis.dtx"}
unpackopts  = "--interaction=batchmode"
unpackexe   = "luatex"

-- Documentation typesetting configuration
typesetexe    = "lualatex"
typesetopts   = "--interaction=batchmode"
typesetruns   = 3 -- Use 3 runs for stability with references/TOCs

-- 3. CONFIGURE CTAN PACKAGE CREATION

-- These settings will create a flat zip named "maine-thesis-2.0.0.zip"
ctanpkg    = "maine-thesis"
ctanzip    = ctanpkg.."-"..pkgversion
packtdszip = false -- Key setting for a flat package
ctanreadme = "CTANREADME.md"


-- 4. UPLOAD & TAGGING CONFIGURATION (Your settings are good here)

-- Load personal data for ctan upload
local ctan_uploader = os.getenv("CTAN_UPLOADER")
local ctan_email = os.getenv("CTAN_EMAIL")

uploadconfig = {
  author      = "R. Padraic Springuel; Camden Bock; Hanna Brooks",
  uploader    = ctan_uploader,
  email       = ctan_email,
  pkg         = ctanpkg,
  version     = pkgversion,
  license     = "lppl1.3c",
  summary     = "Document Class for University of Maine Graduate Thesis",
  description = [[The 'maine-thesis' class provides support for the formating requirements for graduate theses of the Graduate School at The university of Maine. It sets default parameters for the report class, modifies captions, referneces, and the table of contents, and makes specific environments available. The maine-thesis class reflects the guidelines published by the Graduate School at The University of Maine (https://umaine.edu/graduate/students/progress/thesis-resources/). The Graduate School at the University of Maine does not provide official support for any thesis style class or template.]],
  topic       = { "thesis", "dissertation", "class"},
  ctanPath    = "/macros/latex/contrib/" .. ctanpkg,
  repository  = "https://gitlab.com/maine-thesis/maine-thesis",
  bugtracker  = "https://gitlab.com/maine-thesis/maine-thesis/issues",
  support     = "https://gitlab.com/maine-thesis/maine-thesis/issues",
  announcement_file="ctan.ann",
  note_file   = "ctan.note",
  update      = true,
}

-- Update package date and version
tagfiles = {"maine-thesis.dtx", "README.md"}
local mydate = os.date("!%Y-%m-%d")

function update_tag(file, content, tagname, tagdate)
  if not tagname and tagdate == mydate then
    tagname = pkgversion
    tagdate = pkgdate
    print("** "..file.." have been tagged with the version and date of build.lua")
  else
    local v_maj, v_min = string.match(tagname, "^v?(%d+)(%S*)$")
    if v_maj == "" or not v_min then
      print("Error!!: Invalid tag '"..tagname.."', none of the files have been tagged")
      os.exit(0)
    else
      tagname = string.format("%i%s", v_maj, v_min)
      tagdate = mydate
    end
    print("** "..file.." have been tagged with the version "..tagname.." and date "..mydate)
  end

  if string.match(file, "maine-thesis.dtx") then
    local tagdate = string.gsub(tagdate, "-", "/")
    content = string.gsub(content,
                          "%[%d%d%d%d%/%d%d%/%d%d%s+v%S+",
                          "["..tagdate.." v"..tagname)
  end

  if string.match(file, "CTANREADME.md") then
    local tagdate = string.gsub(tagdate, "/", "-")
    content = string.gsub(content,
                          "Version: (%d+)(%S+)",
                          "Version: "..tagname)
    content = string.gsub(content,
                          "Date: %d%d%d%d%-%d%d%-%d%d",
                          "Date: "..tagdate)
  end
  return content
end

uploadconfig = {
  author      = "R. Padraic Springuel; Camden Bock; Hanna Brooks",
  uploader    = ctan_uploader,
  email       = ctan_email,
  pkg         = ctanpkg,
  version     = pkgversion,
  license     = "lppl1.3c",
  summary     = "Document Class for University of Maine Graduate Thesis",
  description = [[The 'maine-thesis' class provides support for the formating requirements for graduate theses of the Graduate School at The university of Maine.
  It sets default parameters for the report class, modifies captions, referneces, and the table of contents, and makes specific environments available.

  The maine-thesis class reflects the guidelines published by the Graduate School at The University of Maine (https://umaine.edu/graduate/students/progress/thesis-resources/).
  The Graduate School at the University of Maine does not provide official support for any thesis style class or template.]],
  topic       = { "class", "Dissertation", "Std conform"},
  ctanPath    = "/macros/latex/contrib/" .. ctanpkg,
  repository  = "https://gitlab.com/maine-thesis/maine-thesis",
  bugtracker  = "https://gitlab.com/maine-thesis/maine-thesis/issues",
  support     = "https://gitlab.com/maine-thesis/maine-thesis/issues",
  announcement_file="ctan.ann",
  note_file   = "ctan.note",
  update      = false,
}

-- Clean files
cleanfiles = {
  ctanzip..".curlopt",
  ctanzip..".zip",
  "example.log",
  "example.pdf",
  "maine-thesis.pdf",
  "maine-thesis-example.pdf",
  "maine-thesis-doc.pdf",
}


-- Line length in 80 characters
local function os_message(text)
  local mymax = 77 - string.len(text) - string.len("done")
  local msg = text.." "..string.rep(".", mymax).." done"
  return print(msg)
end

-- Create check_marked_tags() function
local function check_marked_tags()
  local f = assert(io.open("sources/maine-thesis.dtx", "r"))
  marked_tags = f:read("*all")
  f:close()

  local m_pkgd, m_pkgv = string.match(marked_tags, "%[(%d%d%d%d%/%d%d%/%d%d)%s+v(%S+)")
  local pkgdate = string.gsub(pkgdate, "-", "/")
  if pkgversion == m_pkgv and pkgdate == m_pkgd then
    os_message("** Checking version and date in maine-thesis.dtx: OK")
  else
    print("** Warning: maine-thesis.dtx is marked with version "..m_pkgv.." and date "..m_pkgd)
    print("** Warning: build.lua is marked with version "..pkgversion.." and date "..pkgdate)
    print("** Check version and date in build.lua then run l3build tag")
  end
end

-- Config tag_hook
function tag_hook(tagname)
  check_marked_tags()
end

-- Add "tagged" target to l3build CLI
if options["target"] == "tagged" then
  check_marked_tags()
  os.exit()
end

-- Create make_temp_dir() function
local function make_temp_dir()
  -- Fix basename(path) in windows (https://chat.stackexchange.com/transcript/message/55064157#55064157)
  local function basename(path)
    return path:match("^.*[\\/]([^/\\]*)$")
  end
  local tmpname = os.tmpname()
  tempdir = basename(tmpname)
  errorlevel = mkdir(tempdir)
  if errorlevel ~= 0 then
    error("** Error!!: The ./"..tempdir.." directory could not be created")
    return errorlevel
  else
    os_message("** Creating the temporary directory ./"..tempdir..": OK")
  end
end

-- Add "testpkg" target to l3build CLI
if options["target"] == "testpkg" then
  make_temp_dir()
  errorlevel = cp("*.*", sourcefiledir, tempdir)
  if errorlevel ~= 0 then
    error("** Error!!: Can't copy files from "..sourcefiledir.." to /"..tempdir)
    return errorlevel
  else
    os_message("** Copying files from "..sourcefiledir.." to ./"..tempdir..": OK")
  end
  -- Unpack files
  local file = jobname(tempdir.."/maine-thesis.dtx")
  errorlevel = run(tempdir, "luatex -interaction=batchmode "..file..".dtx > "..os_null)
  if errorlevel ~= 0 then
    error("** Error!!: luatex -interaction=batchmode "..file..".dtx")
    return errorlevel
  else
    os_message("** Running: luatex -interaction=batchmode "..file..".dtx")
  end
  -- lualatex
  local file = jobname(tempdir.."/maine-thesis-example.tex")
  errorlevel = run(tempdir, "lualatex -interaction=nonstopmode "..file.." > "..os_null)
  if errorlevel ~= 0 then
    error("** Error!!: lualatex -interaction=nonstopmode "..file..".tex")
    return errorlevel
  else
    os_message("** Running: lualatex -interaction=nonstopmode "..file..".tex")
  end
  -- Copying
  os_message("** Copying "..file..".log and "..file..".pdf files to main dir: OK")
  cp("example.log", tempdir, maindir)
  cp("example.pdf", tempdir, maindir)
  -- Clean
  os_message("** Remove temporary directory ./"..tempdir..": OK")
  cleandir(tempdir)
  lfs.rmdir(tempdir)
  os.exit()
end