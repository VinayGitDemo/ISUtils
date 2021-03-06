<html>
<head>

%include snippets/htmlHeadDefaults.dsp%

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<script src="common-menu.js"></script>
<script type="text/javascript">
var selected = null;
var menuInit = false;

function menuSelect(object, id) {
  selected = menuext.select(object, id, selected);
}

function menuMouseOver(object, id) {
  menuext.mouseOver(object, id, selected);
}

function menuMouseOut(object, id) {
  menuext.mouseOut(object, id, selected);
}

function initMenu(firstImage) {
    menuInit = true;
    return true;
}

</script>
</head>

%invoke wx.config.impl.ui:mainMenu%
<body class="menu" onload="initMenu('%value buttonUrls/sections[0]/submenu[0]/url encode(javascript)%');">
<table class="menuTable" width="100%" cellspacing="0" cellpadding="0" border="0">

%scope buttonUrls%
%loop sections%
    %ifvar name equals('hide')%
    %else%
        %scope param(truestr='true') param(falsestr='false') param(expanded='true')%
            %rename ../name name -copy%
            %rename ../text text -copy%
            %ifvar text equals('Server')%
                %rename truestr expanded -copy%
            %endif%
            %include menu-section.dsp%
        %endscope%
    %endif%

    %loop submenu%
        %ifvar url -notempty%
            %scope param(tablerow='table-row') param(display='table-row') param(class='menuitem-selected') param(className='xyz')%
                %rename ../../text section -copy%
                %rename ../text text -copy%
                %rename ../url url -copy%
                %rename ../target target -copy%
                %ifvar section equals('Server')%
                    %rename tablerow display -copy%
                    %ifvar url equals('stats-general.dsp')%
                        %rename class className -copy%
                    %endif%
                %endif%
                %include menu-subelement.dsp%
            %endscope%
        %endif%
    %endloop%
%endloop%
%endscope%
</table>
</body>
</html>
