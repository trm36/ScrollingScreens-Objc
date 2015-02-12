# ScrollingScreens-Objc

A simple iOS app demonstrating the UIPageViewController

### Step 1: Create a PageViewControllerDataSource class
- In the class add 4 instance methods
  - initialViewController returns a ContentViewController with the first item in the content
  - viewControllerAtIndex
    - creates a ContentViewController and sets the index and name of the content at the index from the ContentController
    - if the index < 0 or >= count it returns nil
  - viewControllerBeforeViewController gets the index of the viewController, subracts 1 and then calls viewControllerAtIndex
  - viewControllerAfterViewController gets the index of the viewController, adds 1 and then calls viewControllerAtIndex
  - See https://gist.github.com/jkhowland/4d64fbb23c793b4fbd3e 
  
### Step 2: Add the PageViewController to the PresentationViewController
- Add pageViewController as a property
- Add PageViewControllerDataSource as a property
- In the viewDidLoad method initialize self.pageViewController
- Initialize self.dataSource method
- Set the dataSource of self.pageViewController to the self.dataSource
- Call the setViewControllers method and pass in the initialViewController
