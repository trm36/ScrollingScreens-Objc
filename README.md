# ScrollingScreens-Objc

A simple iOS app demonstrating the UIPageViewController

## Part 1: UIPageViewController

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
- Add the pageViewController as a childViewController of the PresentationViewController
- See https://gist.github.com/jkhowland/b84b4f11aacce5ff4ca1

## Part 2: UIPageControl

### Step 3: Add pageCount to the PageViewControllerDataSource
- Add the method pageCount that returns an NSInteger
- Return the ContentController's content count
 
### Step 4: Add UIPageControl property and delegate methods to PageViewController
- Add UIPageControl as a property
- Initialize the property and set the number of pages to the dataSource's pageCount
- Add willTransitionToViewControllers
  - The method should get the ContentViewController out of the pendingViewControllers array, and set the currentPage to the viewController's index
- Add didFinishAnimating:previousViewControllers method
  - The method should get the ContentViewController out of the previousViewControllers array, and if completed is false you should set the currentPage to the viewController's index (because they never landed on the new page)
  - See https://gist.github.com/jkhowland/383322c48976acc13a0b

### Bonus: Use built in UIPageControl (with UIAppearance)
- Add a presentationCountForPageViewController method to the PageViewControllerDataSource that returns the content count
- Add a presentationIndexForPageViewController method to the PageViewControllerDataSource that returns 0
- Update the UIPageControl appearance in the app delegate
  - See https://gist.github.com/jkhowland/fdbd269af0df8052a6a9
