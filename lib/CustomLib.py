from robot.api.deco import keyword

from webdriver_manager.chrome import ChromeDriverManager

__version__ = '1.0.0'

ROBOT_AUTO_KEYWORDS = False

class CustomLib(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    @keyword
    def get_chromedriver_path(self):
        driver_path = ChromeDriverManager().install()
        print(driver_path)
        return driver_path

