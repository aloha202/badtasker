/**
 * Created by alexradyuk on 6/17/18.
 */
$(function () {


    var activeTable;
    function initTable(div){
        if(!$(div).hasClass('table-initialized')) {
            $(div).draggable({
                containment: "parent",
                grid: [ 10, 10 ],
                drag: function(){
                    printoutActiveTable();
                }
            }).resizable({
                grid: 10,
                resize: function(){
                    printoutActiveTable();
                }
            });
            $(div).addClass('table-initialized');
            $(div).mousedown(function(){
                setActiveTable(this);
            });
            $(div).click(function (e) {
                e.stopPropagation();
            })
        }
    }

    function printoutActiveTable(){
        var w = activeTable ? parseInt($(activeTable).css('width')) / 10 : '';
        var h = activeTable ? parseInt($(activeTable).css('height')) / 10 : '';
        var left = activeTable ? parseInt($(activeTable).css('left')) / 10 : '';
        var top = activeTable ? parseInt($(activeTable).css('top')) / 10 : '';
        var id = activeTable ? $(activeTable).data('id') : '';
        var num = activeTable ? $(activeTable).data('number') : '';
        $('#showTableWidth').text(w);
        $('#showTableHeight').text(h);
        $('#showTableLeft').text(left);
        $('#showTableTop').text(top);
        $('#showTableId').text(id);
        $('#activeTableNum').val(num);
    }

    function setActiveTable(table){
        saveActiveTable();
        $('#floorCanvas .table').removeClass('active-table');
        if(table) {
            $(table).addClass('active-table');
        }
        activeTable = table;
        printoutActiveTable();

    }
    function initTables(){
        $('#floorCanvas .table').each(function(){
            initTable(this);
        });
        $('#floorCanvas').click(function(e){
            setActiveTable(null);
        });

        $('#addTableButton').click(function(){
            setActiveTable(null);
            var div = document.createElement('div');
            $(div).addClass('table');
            var div2 = document.createElement('div');
            $(div2).addClass('within');
           $('#floorCanvas').append(div);
           $(div).append(div2);

           var span = document.createElement('span');
           $(div2).append(span);
            initTable(div);
            setActiveTable(div);
            $.get(URL_createTable, function (resp) {
                $(div).data('id', resp);
            });
           return false;
        });
        $('#saveTableButton').click(function(){
            saveActiveTable();
            return false;
        });
        $('#deleteTableButton').click(function(){
            deleteActiveTable();
        });
        $('#activeTableNum').keyup(setActiveTableNum);
        $('#activeTableNum').change(setActiveTableNum);
    }

    function setActiveTableNum() {
        if(activeTable){
            $(activeTable).data('number', $('#activeTableNum').val());
            $(activeTable).find('span').text($('#activeTableNum').val());
        }
    }

    function saveActiveTable(){
        if(activeTable) {
            $.post(URL_updateTable, {
                'id': $(activeTable).data('id'),
                'place[width]': $('#showTableWidth').text(),
                'place[height]': $('#showTableHeight').text(),
                'place[posx]': $('#showTableLeft').text(),
                'place[posy]': $('#showTableTop').text(),
                'place[number]': $(activeTable).data('number')
            }, function(resp){
                // silence
            })
        }
    }

    function deleteActiveTable(){
        if(activeTable) {
            $.get(URL_deleteTable, {id: $(activeTable).data('id')}, function (resp) {
                // silence
            });
            $(activeTable).remove();
            activeTable = null;
            printoutActiveTable();
        }
    }
    initTables();
});