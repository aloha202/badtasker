var sfForm = {
    row_finder: {
        def: function(id)
        {
            return $('#' + id);
        },
        '2parents': function(id)
        {
            return $('#' + id).parent().parent();
        },
        bootstrap: function(id){
            return $('#' + id).parents('.control-group');
        },
        materialize: function(id){
            return $('#' + id).parents('.input-field')
        }
    },
    visualization: {
      simple: ['show', 'hide'],
      slide: ['slideDown', 'slideUp'],
      fade: ['fadeIn', 'fadeOut']
    },
    base_initialize: function(){
        this.initDatepicker();
        this.initDefaultvalues();
        this.initGmapsWidget();
    },
    initDatepicker: function(){
        if($.fn.datepicker){
            $('.datepicker').each(function(){
                var params = $.parseParams($(this).attr('datepicker'));
                $(this).datepicker(params);
            });                            
            Wait($.datepicker.regional, Config.PR_LANG, function(regional){
                $('.datepicker').each(function(){
                    try{
                        var val = $(this).val().split(' ')[0];
                        var date = $.datepicker.parseDate('yy-mm-dd', val);
                        $(this).val($.datepicker.formatDate(regional.dateFormat, date));
                    }catch(e){}                    
                });

                //$('.datepicker').val(regional.dateFormat);
            });
            $('form').submit(function(){
               $(this).find('.hasDatepicker').each(function(){
                  // alert($.datepicker.regional[Config.PR_LANG].dateFormat);
                  var date = $.datepicker.parseDate($.datepicker.regional[Config.PR_LANG].dateFormat, $(this).val());
                  date = $.datepicker.formatDate('yy-mm-dd', date);
                  $(this).after("<input type='hidden' name='" + this.name + "' value='" + date + "' />");
               });
            });
        }            
    },
    initToggleDependencies: function(dependencies, row_finder_name, visualization)
    {
        row_finder_name = row_finder_name || 'def';
        visualization = visualization || 'simple';
        for(var toggler in dependencies){
            var fields = dependencies[toggler];
            $('#' + toggler).each(function(){
               var $this = $(this);
               function change(event)
               {
                   var func;
                   if($this.prop('checked')){
                       func = event ? sfForm.visualization[visualization][0] :'show';
                   }else{
                       func = event ? sfForm.visualization[visualization][1] :'hide';
                   }
                   $(fields).each(function(){
                        sfForm.row_finder[row_finder_name](this)[func]();
                   });
                   
               }
               $this.change(change);
               change(false);
            });
        }
    },
    initDefaultvalues: function()
    {
        $('form input.defaultvalue, form textarea.defaultvalue').focus(function(){
           var defaultvalue = $(this).attr('defaultvalue');
           if($(this).val() == defaultvalue){
               $(this).val('');
           }
        }).blur(function(){
           var defaultvalue = $(this).attr('defaultvalue');
           if($(this).val() == ''){
               $(this).val(defaultvalue);
           }            
        });
    },
    initChoiceDependencies: function(dependencies, row_finder_name, visualization)
    {
        visualization = visualization || 'simple';        
        row_finder_name = row_finder_name || 'def';        
        for(var toggler in dependencies){

            var deps = dependencies[toggler];
            var fields = [];
            $('#' + toggler).each(function(){
               var $this = $(this);
               $this.attr('dependency_fields', fields);
               function change(event)
               {
                   $(deps.__all).each(function(){
                      sfForm.row_finder[row_finder_name](this).hide(); 
                   });
                   var func = event ? sfForm.visualization[visualization][0] :'show';
                   if(deps[$this.val()]){
                       $(deps[$this.val()]).each(function(){
                           sfForm.row_finder[row_finder_name](this)[func](); 
                       });
                   }
               }
               $this.change(change);
               change();
            });
        }
    },
    initGmapsWidget: function(){
        var url = 'http://maps.google.com/maps/api/geocode/json?address=%address%&sensor=false&language=' + Config.PR_LANG;
        $('.my_widget_form_gmaps').each(function(){
           var $this = $(this);
           var $ip_address = $(this).find('.input_lookup_address'); 
           var $ip_address_button = $(this).find('.input_lookup_address_button');
           Wait(window, 'google_maps', function(obj){
              Wait(obj, $this.attr('map_id'), function(map){
                map.map.onDragEnd = function(lat, lng){
                    sfForm.geocodeLatlng(lat, lng, function(json){
                        var parsed = sfForm.parseGeocodeJson(json);
                        sfForm.setWidgetMap(parsed, $this, map, true);
                    });
                };
                function getCoords(){
        
                     var address = $.trim($ip_address.val());
                     if(address){
                         sfForm.geocodeAddress(address, function(json){
                                 var parsed = sfForm.parseGeocodeJson(json);
                                 sfForm.setWidgetMap(parsed, $this, map);
                         })
                     }               
                }
                $ip_address_button.click(getCoords);
                $ip_address.keydown(function(e){
                    if(e.keyCode == 13){
                         getCoords();
                         return false;
                    }
                }).keypress(function(e){
                    if(e.keyCode == 13){
                         return false;
                    }
                }).keyup(function(){
                });

                if(!$this.find('.input_lat').val() || !$this.find('.input_lng').val()){
                    if($this.find('.search_by_default').size() && $this.find('.search_by_default').val()){
                        $ip_address.val($this.find('.search_by_default').val());
                        setTimeout(function(){
                         getCoords();
                        }, 100);

                    }
                }
                if($this.find('.input_address_formatted').val()){
                    $ip_address.val($this.find('.input_address_formatted').val());
                }
              }) ;
           });

           
        });   
    },
    parseGeocodeJson: function(json){
        var parsed = {};
        $.each(json.results[0].address_components, function(){
            parsed[this.types[0]] = this.long_name;
        });
        parsed.formatted = json.results[0].formatted_address;
        parsed.lat = json.results[0].geometry.location.lat;
        parsed.lng = json.results[0].geometry.location.lng;        
        return parsed;
    },
    geocodeAddress: function(address, callback){
        var url = 'http://maps.google.com/maps/api/geocode/json?address=%address%&sensor=false&language=' + Config.PR_LANG;
        $.get(url.replace('%address%', address), function(json){
            if(json.status =='OK'){
                callback(json);
            }
        });
    },    
    geocodeLatlng: function(lat, lng, callback){
        var url = 'http://maps.google.com/maps/api/geocode/json?latlng=%latlng%&sensor=false&language=' + Config.PR_LANG;
        $.get(url.replace('%latlng%', lat + ',' + lng), function(json){
            if(json.status =='OK'){
                callback(json);
            }
        });
    },       
    setWidgetMap: function(parsed, $this, map, SHOW_LOOKUP_ADDRESS){
        var center = new google.maps.LatLng(parsed.lat, parsed.lng);
        map.map.setCenter(center);
        map.marker.setPosition(center);
        $this.find('.input_lat').val(parsed.lat);
        $this.find('.input_lng').val(parsed.lng); 

        if(parsed.country){
            $this.find('.input_country').val(parsed.country);
        }
        if(parsed.locality){
            $this.find('.input_city').val(parsed.locality);
        }                            
        if(parsed.route){
            var addr = parsed.route;
            if(parsed.street_number){
                addr += ', ' + parsed.street_number;
            }
            $this.find('.input_address').val(addr);                                
        }
        if(parsed.formatted){
            $this.find('.input_address_formatted').val(parsed.formatted);
            if(SHOW_LOOKUP_ADDRESS){
                 $this.find('.input_lookup_address').val(parsed.formatted);
            }            
        }              
    }
};