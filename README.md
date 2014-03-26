# ExCITe App
An iPad-based iOS app created to encourage user exploration of the ExCITe Center at Drexel University, as well as facilitate interaction with projects housed within the space. The app currently consists of a dynamically generated map of the center and a controller for its Phillips Hue lights. The end goal is to develop a polished and intuitive application to create an empowering user experience for visitors of ExCITe.

## Map Design
The app initializes with a grid composed of both filled and stroked blocks. This grid is an abstract representation of the green carpet tiles that begin at the entrance and continue through the ExCITe Center. The map began as a very literal concept, closely mimicking the original floor plan of the space. The reason for abstraction is to depart from the idea of ExCITe being tied to a physical location. Additionally, an abstract approach is more encouraging of discovery; instead of guiding users through the space on a pre-built tour, the idea is to present users with something that will pique their curiosity and encourage exploration.

As mentioned, the map is dynamically generated. It is represented in the local JSON file as a matrix of 0s (blank space), 1s (filled blocks), and 2s (stroked blocks). The goal behind creating a dynamic map is to mimic the flexibility of the space as a whole; therefore, if the space changes, the JSON file can easily be updated to reflect those changes.

The filled blocks are buttons that allow the user to view content pertaining to various projects housed within ExCITe. A staggered glow effect is applied to buttons to indicate that they can be touched, as well as to loosely guide users through the space. These buttons are also included in the JSON file and can be edited to match the map.

Earlier versions of the app were designed for portrait mode, but the switch to landscape mode was implemented after deciding that rotating the map more accurately mimics the angle at which users enter the space.

The color scheme is inspired by [flatuicolors](http://flatuicolors.com/).

## Map Implementation
### MapViewController
MapViewController is a subclass of UIViewController that parses a JSON file containing data pertaining to the map. After parsing this file, MapViewController generates a map, as well as buttons that display information when touched.

### MapView
MapView is a subclass of UIView that calculates the grid upon which the map is created, then draws filled or stroked blocks based on the data in the JSON file.

### MapButton
MapButton is a subclass of UIButton that draws blocks over the existing map to create buttons. It also implements methods from UIView+Glow to apply a staggered glowing effect to the buttons.

### UIView+Glow
UIView+Glow is a subclass of UIView, created by [thesecretlab](https://github.com/thesecretlab), that adds support for making views glow. Read the documentation [here](https://github.com/thesecretlab/UIView-Glow).

### mapData.json
mapData.json is a file containing the data that is parsed and displayed by MapView. The map is represented by a matrix, which can be edited to change the appearance of the map upon initialization of the app. The glowing buttons are also represented by matrices, which must be updated along with the original map matrix. These button objects also contain information that's displayed when the corresponding button is touched.

* "matrix" indicates the configuration of the blocks that make up the button.
* "title" indicates the string that will populate locationLabel in MapViewController.
* "x" indicates the x-coordinate at which the button will be displayed.
* "y" indicates the y-coordinate at which the button will be displayed.
* "description" indicates the string that will populate locationInfo in MapViewController.

All content contained in this file can be edited. Keep in mind that any changes to the title or description in the “Welcome to the ExCITe Center” section must also be edited in mapViewController.m.

## Hue Light Controller Design
Although functional, the hue light controller is mainly a proof of concept for the app. It allows users to select individual lights, adjust the color and brightness, and watch the lights update in real time. The concept is simple, but illustrates the potential of facilitating interaction between users and the space through the app.

## Hue Light Controller Implementation
### LightsViewController
LightsViewController is a subclass of UIViewController that implements the Hue Light graphics, color wheel, and controls.

### LightsView
LightsView is a subclass of UIView that implements the Hue Light graphics.

### ios-color-wheel
ios-color-wheel is a color picker application by [inline studios](https://www.inline-studios.com/). Read the documentation [here](https://code.google.com/p/ios-color-wheel/).

## Continuing Work
1. Create an editing system for the map that doesn’t involve directly editing the JSON file. Ideally, this would be a GUI that allows the maintainer to edit content displayed by the app without having to access project files.
2. Serve the JSON file from the Mac Mini and implement try/catch logic that fetches and parses this file; if the file cannot be found, allow the app to use a local copy of the JSON file instead.
3. Further develop the content displayed in the map interface. The goal is not to regurgitate information from the website, but to summarize that data and perhaps provide other interesting pieces of information. The inclusion of images may also be useful to help users place themselves within the space.
4. Refine the app to create a more seamless experience. An example of this is to perhaps include interactive capabilities within the map interface, rather than using separate navigation tabs.
5. Refine the Hue Light Controller to function as a touch device rather than a point-and-click device. Remove the color wheel at the bottom of the interface and instead implement a color wheel (or panel of additional settings) that appears when a light is activated by touch. The goal of the Hue Light Controller is to be a more visually engaging experience.
6. Rethink the visual feedback distinguishing a selected bulb from a deselected bulb. The difference is clear, but the functionality is not.
7. Explore utilizing augmented reality for spatial exploration. For example, a user could carry an iPad through the space, point the camera at the MRP, and view overlaid information as well as ways to interact with the project. This promises a more cohesive experience for the user and also provides the ability to use visual targets (perhaps art pieces) throughout the space as “easter eggs.”
8. Explore more methods of interacting with projects in the space. Examples:
 * Remotely play the MRP.
 * Change the color of the hue lights based on sound from the MRP.
 * Implement ability to “check in,” identify a workspace, and allow users to find each other via the app.