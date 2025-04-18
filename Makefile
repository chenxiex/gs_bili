MINGW_LIB ?= /usr/x86_64-w64-mingw32/lib
VPATH = src lib $(MINGW_LIB)

.PHONY: mkdir all

all: mkdir hook.exe main.dll

mkdir:
	@mkdir -p bin

hook.exe: hook.cpp libshlwapi.a
	x86_64-w64-mingw32-g++ -o bin/$@ $?

main.dll: main.c libMinHook.a
	x86_64-w64-mingw32-gcc -o bin/$@ $? -I . -shared
