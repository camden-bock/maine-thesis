-- Identify the bundle and main module
bundle = "maine-thesis"
module = "maine-thesis"

typesetexe = "lualatex"

-- Specify the directory where the main source files (.dtx, .ins) are located
maindir       = "."
sourcefiledir = "./sources"
textfiledir   = "./sources"
textfiles     = {textfiledir.."/CTANREADME.md"}
sourcefiles   = {"maine-thesis.dtx"}
installfiles  = {"maine-thesis.pdf", "maine-thesis.cls"}

unpackfiles = {"maine-thesis.dtx"}
unpackopts  = "--interaction=batchmode"
unpackexe   = "luatex"


-- Set the name for the main documentation.
-- We'll assume the main documentation is compiled from myclass.dtx
typesetfiles  = {"maine-thesis.dtx", "example.tex"}
typesetexe    = "lualatex"
typesetopts   = "--interaction=batchmode"
typesetruns   = 3
makeindexopts = "-q"


-- Build example.tex using lualatex (one run)
local function type_example()
  local file = jobname(unpackdir.."/example.tex")
  errorlevel = run(unpackdir, "lualatex --interaction=batchmode "..file..".tex > "..os_null)
  if errorlevel ~= 0 then
    error("** Error!!: lualatex --interaction=batchmode "..file..".tex")
    return errorlevel
  else
    print("** Running: lualatex --interaction=batchmode "..file..".tex")
  end
  return 0
end

specialtypesetting = { }
specialtypesetting["example.tex"]= {func = type_example}

-- Update package date and version
tagfiles = {"maine-thesis.dtx", "CTANREADME.md"}
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