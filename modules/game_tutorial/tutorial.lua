tutorialWindowID   = 'tutorialButton'
tutorialOpen       = false
currentIndex       = 0
loginCountExtended = 201
currentLabel       = false
currentCategorie   = false
maxCategories      = 0

local form = {
    assignWindow = nil,
    oakImg       = nil,
    indexList    = nil,
    lines        = {},  
}

local config = {
  categoriesColor = "#afa9a0",
}

function setCategoriesColor()
    for x = 1, #tutorialsIndex do
        form.indexList:getChildById("index" .. x):setColor(config.categoriesColor)
    end
end

function setLanguage(str)
    if str == 'en' then
      dofile('configs_en.lua')
      tutorialsIndex = tutorialsIndex_en
      tutorialsInfo  = tutorialsInfo_en
    else
      dofile('configs_es.lua')
      tutorialsIndex = tutorialsIndex_es
      tutorialsInfo  = tutorialsInfo_es
    end
    
    maxCategories  = #tutorialsIndex
        
    -- Limpar as limpas existentes     
    for index, widget in pairs(form.lines) do
      widget:destroy()
    end    
    form.lines = {}
        
    -- Recriar linhas 
    for sectionIndex, section in pairs(tutorialsIndex) do
        local label = g_ui.createWidget('TutorialLabel', form.indexList)
        label:setId("index" .. sectionIndex)
        label.index = sectionIndex
        label:setText(section)
        label:setColor(config.categoriesColor)
        table.insert(form.lines, label)

        for index, currentTutorial in pairs(tutorialsInfo[sectionIndex]) do
            local labelTree = g_ui.createWidget('TutorialLabel', form.indexList)
            labelTree.img   = currentTutorial.img
            labelTree:setId("index" .. sectionIndex .. "labelTree" .. index)
            labelTree.description = currentTutorial.text
            labelTree:setText("    " .. currentTutorial.name)
            labelTree:setVisible(false)
            labelTree.index      = sectionIndex
            labelTree.label      = index
            labelTree.isTutorial = true
            table.insert(form.lines, labelTree)
        end
    end
  
end

function init()    
    
    tutorialButton = modules.client_topmenu.addLeftGameButton(tutorialWindowID, tr('Guide'), 'imgs/tutorial', onClickTutorial, false, true)

    tutorialWindow = g_ui.loadUI('tutorial', rootWidget)
    tutorialWindow:hide()

    form.assignWindow = tutorialWindow:getChildById('tutorialImg')
    form.oakImg       = tutorialWindow:getChildById('oak')
    form.indexList    = tutorialWindow:getChildById('indexList')

    setLanguage('en')

    connect(form.indexList, {
        onChildFocusChange = changeFocusIndexList
    })

    connect(g_game, { 
        onGameEnd = hideAll
    })
    
    g_keyboard.bindKeyPress('Up',   nextTutorial,  tutorialWindow)
    g_keyboard.bindKeyPress('Down', priorTutorial, tutorialWindow)    
end

function onCLickBackButton()
    form.indexList:setVisible(true)

    for y = 1, #tutorialsIndex do
        for x = 1, #tutorialsInfo[y] do
            local label = tutorialList:getChildById(y .. x)
            label:setVisible(false)
        end
    end

    form.indexList:focusChild(nil)
    backButton:setVisible(false)

    local tutorialText = tutorialWindow:getChildById('scrollablePainel'):getChildById('tutorialText')
    tutorialText:setText()
    form.assignWindow:setImageSource("imgs/default")
end

function setToDefault(state)
    if state then
        tutorialWindow:getChildById('scrollablePainel'):setVisible(false)
        tutorialWindow:getChildById('textScroll'):setVisible(false)
        form.assignWindow:setHeight(375)

        form.assignWindow:setImageSource("imgs/default")
        form.oakImg:setVisible(true)
    else
        form.assignWindow:setHeight(206)
        tutorialWindow:getChildById('scrollablePainel'):setVisible(true)
        tutorialWindow:getChildById('textScroll'):setVisible(true)
        form.oakImg:setVisible(false)
    end
end

function changeFocusIndexList(self, focusedChild)
    if focusedChild == nil then return end

    for x = 1, #tutorialsIndex do
        if x == focusedChild.index then
            for y = 1, #tutorialsInfo[x] do
                if focusedChild.isOpen then
                    form.indexList:getChildById("index" .. x .. "labelTree" .. y):setVisible(false)
                else
                    form.indexList:getChildById("index" .. x .. "labelTree" .. y):setVisible(true)
                end
            end
            break
        end
    end

    if focusedChild.isTutorial then
        setToDefault(false)
        local tutorialText = tutorialWindow:getChildById('scrollablePainel'):getChildById('tutorialText')
        tutorialText:setText(focusedChild.description)
        form.assignWindow:setImageSource(focusedChild.img)

        currentLabel = focusedChild.label
        currentCategorie = focusedChild.index
    else
        if focusedChild.isOpen then focusedChild.isOpen = false else focusedChild.isOpen = true end
        setToDefault(true)
        currentLabelIndex = false
        currentCategorie = false

        if focusedChild.isOpen then
            form.indexList:focusChild(form.indexList:getChildById("index"..focusedChild.index.."labelTree1"))
            setLastDefault = false
        else
            form.indexList:focusChild(nil)
        end
    end

    setCategoriesColor()
end

function nextTutorial()
    if currentLabel and currentCategorie then
        local child = form.indexList:getChildById("index"..currentCategorie.."labelTree"..currentLabel-1)

        if child then
            form.indexList:focusChild(child)
        else
            if currentCategorie-1 >= 1 then
                setLastDefault = #tutorialsInfo[currentCategorie-1]
                form.indexList:getChildById("index"..currentCategorie-1).isOpen = true
                form.indexList:focusChild(form.indexList:getChildById("index"..(currentCategorie-1).."labelTree"..(#tutorialsInfo[currentCategorie-1])))
            end
        end
    end
end

function priorTutorial()
    if currentLabel and currentCategorie then
        local child = form.indexList:getChildById("index"..currentCategorie.."labelTree"..currentLabel+1)

        if child then
            form.indexList:focusChild(child)
        else
            if currentCategorie+1 <= maxCategories then
                form.indexList:getChildById("index"..currentCategorie+1).isOpen = true
                form.indexList:focusChild(form.indexList:getChildById("index"..(currentCategorie+1).."labelTree1"))
            end
        end
    else
        form.indexList:getChildById("index1").isOpen = true
        form.indexList:focusChild(form.indexList:getChildById("index1labelTree1"))
    end    
end

function destroyAll()
    tutorialWindow:destroy()
    tutorialButton:destroy()
end

function hideAll()
    tutorialWindow:hide()
end

function terminate()
    disconnect(g_game, { 
        onGameEnd = hideAll
    })

    destroyAll()
    --g_game.unhandleExtended(loginCountExtended)
end

function onOpenTutorial()
    form.indexList:focusChild(nil)
    tutorialOpen = true
    tutorialWindow:show()
    tutorialWindow:raise()
    tutorialWindow:focus()
    currentIndex = 0

    setToDefault(true)
    setCategoriesColor()
    tutorialButton:setImageSource("imgs/tutorial")

    currentLabel = false
    currentCategorie = false
end

function onClickTutorial()
    if not tutorialOpen then
        onOpenTutorial()    
        local node = g_settings.getNode('firsttimeseta') or {}
        if node then
            if not node[tutorialWindowID] then
                node[tutorialWindowID] = true
                g_settings.setNode('firsttimeseta', node)
            end      
            if tutorialButton:getChildById('setaCima') then    
                tutorialButton:getChildById('setaCima'):destroy()
            end      
        end 
    else              
        tutorialOpen = false
        tutorialWindow:hide()
    end
end