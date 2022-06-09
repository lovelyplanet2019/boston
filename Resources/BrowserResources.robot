*** Settings ***
Resource    BrowserParameters.robot


*** Variables ***
#*** Menus
${Menu-Mapping}                     //span[text()="Mapping"]
${Menu-Maps}                        //span[text()="Maps"]


#*** Mapping Main Page
${Page-Content-Before-Launch-After-Shutdown}       "Mapping service is currently not connected"
${Launch-Button}                                   //button/span[text()="Launch"]
${Shutdown-Button}                                 //button/span[text()="Shutdown"]
${Mapping-Map}                                     //div[@id="mappingMap"]

${2D-Map-Button}                                    //span[normalize-space()='2D Map']
${3D-Map-Button}                                    //span[normalize-space()='3D Map']

#*** Save Mapping
${World-Name-InputField}                           //input[@placeholder='World Name']
${Map-Name-InputField}                             //input[@placeholder='Map Name']
${Save-Mapping-Button}                             //span[normalize-space()='Save Mapping']

#*** 3D Map
${Visibility-Expand-Group}                         //span[normalize-space()='Visibility']
${Visibility-Point-Cloud-Checkbox}                (//span[contains(text(),'PointCloud')])[1]
${Visibility-Odometry-Checkbox}                   (//span[normalize-space()='Odometry'])[1]
${Visibility-Axes-Helper-Checkbox}                (//span[normalize-space()='Axes Helper'])[1]
${Visibility-Stats-Widget-Checkbox}                (//span[normalize-space()='Stats Widget'])[1]

${Point-Cloud-Expand-Group}                        //span[@class='ant-collapse-header-text'][normalize-space()='PointCloud']

${Stats-Widget-Points-0}                            //div[normalize-space()='Points: 0']

${Slider}
${Red-Color-Button}                                     //div[@title='#F44336']
${Pink-Color-Button}                                    //div[@title='#E91E63']
${Purple-Color-Button}                                  //div[@title='#9C27B0']
${Blue-Color-Button}                                    //div[@title='#2196F3']
${Green-Color-Button}                                   //div[@title='#1DA57A']
${Yellow-Color-Button}                                  //div[@title='#FFEB3B']
${Orange-Color-Button}                                  //div[@title='#FF9800']
${Brown-Color-Button}                                   //div[@title='#795548']
${Gray-Color-Button}                                   //div[@title='#607D8B']

#*** Maps Page
#TBD. World 'test' and Map 'test2' is hardcoded (folder pre-created at local machine). to enhance script to make it dynamic variable when visit office connect to actual device.
${Expand-THIS-Map}                    //td[text()='${TC002-WorldName2D}']//button[@class='ant-table-row-expand-icon ant-table-row-expand-icon-collapsed']

${Delete-THIS-World}             //td[text()='${TC002-WorldName2D}']/following-sibling::td[.//span[@aria-label='delete']]
${Delete-THIS-Map}               //td[text()='${TC002-MapName2D}']/following-sibling::td[.//span[@aria-label='delete']]

${Delete-Map-OK}                //button/span[text()="OK"]
${Delete-Map-Cancel}            //button/span[text()="Cancel"]

${Maps-Next-Page-Button}       li[title="Next Page"]
${Maps-Previous-Page-Button}   li[title="Previous Page"]

${Maps-First-Page-Button}    //a[text()='1']

