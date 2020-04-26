# miniupnp-nuget-vc
[MiniUPnP](https://github.com/miniupnp/miniupnp) library NuGet packages building workplace.

## Nuget Gallery
### MiniUPnPc (MiniUPnP client)
- [NuGet Gallery | miniupnpc-vc142 2.0.0](https://www.nuget.org/packages/miniupnpc-vc142)

## Usage
Run the following command in the Package Manager Console on Visual Studio 2019.
```
PM> Install-Package miniupnpc-vc142
```

## How to package (for Package Owner)
Run the commands below on a Command Prompt.
```
build.bat

cd packaging\nuget-vc142
package.bat
```
