# Food2ForkChallenge
The App should run on an iPhone X as it hasn't been thought of it for a different screen size.
 
 
### Architecture
It follows the MVVM patter and it is divided in modules. Each of them are abstracted and encapsulated by DI containers. The App module sets the root view controller as the User Interface module initial view controller. It needs to know no more about the UI.

Navigations are extracted to components called Navigators to remove boilerplate code from View Controller. This would prove useful for complex navigations such as custom transitions.

Followin Clean Architecture guidlines, the App is divided into:

- UserInterface
- Repository
- Domain

### Unit Testing
I've added some test to the Repository module as an example of practice. By no means I was trying to have 100% converage.

### GitFlow
In this repository, I've tried to use GitFlow Guidlines: branches come from master, are merged in develop and finally develop is merged into master.