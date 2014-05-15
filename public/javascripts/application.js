var map;
var placemark;

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

function init_point_(form_name) {
  lat = $("#" + form_name + "_addresses_attributes_0_lat");
  lng = $("#" + form_name + "_addresses_attributes_0_lng");

  var point = new YMaps.GeoPoint(lat.val(), lng.val());
  placemark.setGeoPoint(point);
  placemark.setOptions({draggable: true});
  map.setCenter(point, 12);
  YMaps.Events.observe(placemark, placemark.Events.DragEnd, function (obj) {
    var current = obj.getGeoPoint().copy();
    lat.val(current.getX());
    lng.val(current.getY());
  });
}

function initialize_map() {
  var m = document.getElementById("map")
  if(m == null) return;

  map = new YMaps.Map(m);

  var zoom = new YMaps.Zoom();
  var typeControl = new YMaps.TypeControl();
  var scaleLine = new YMaps.ScaleLine();
  map.addControl(zoom);
  map.addControl(typeControl);
  map.addControl(scaleLine);

  penza_center = new YMaps.GeoPoint(45.018662, 53.195097);
  map.setCenter(penza_center, 12);

  //placemark = new YMaps.Placemark(penza_center, {draggable: true});
  //map.addOverlay(placemark);

  init_point();
}

$(document).ready(function() {
  $("#tabs").tabs();

  $("a[rel^='lightbox']").slimbox({overlayFadeDuration:200,
    imageFadeDuration:200,
    resizeDuration:200,
    captionAnimationDuration:200}, null, function(el) {
	  return (this == el) || ((this.rel.length > 8) && (this.rel == el.rel));
    }
  );

  initialize_map();

  $("#find_address").live("click", function() {
    form_name = $(this).attr('data-form-name');
    city = $("#"+form_name+"_addresses_attributes_0_city_id option:selected").text();
    address_line = $("#"+form_name+"_addresses_attributes_0_address_line").val();
    var geocoder = new YMaps.Geocoder(city + " " + address_line);
    YMaps.Events.observe(geocoder, geocoder.Events.Load, function () {
      if (this.length()) {
        var point = this.get(0).getGeoPoint();
        placemark.setGeoPoint(point);
        map.panTo(point);
        $("#"+form_name+"_addresses_attributes_0_lat").val(point.getX());
        $("#"+form_name+"_addresses_attributes_0_lng").val(point.getY());
      } else {
        alert("Адрес не найден.")
      }
    });
  });

/*  $('.select_checkbox').each.change() {
    $(this).toggleClass("active");
    });*/
  $('#list').click( function() {
//    $(this).find(":checkbox").click();
    //$('#list').css("background-color",'green');
    //this.child().child().checked = false;
//    $(this).find(":checkbox").checked = !($(this).find(":checkbox").checked);
    //$(this).find(":checkbox").attr("checked","checked");

    if ($(this).find(":checkbox").attr("checked")) {
        //$(this).find(":checkbox").attr("checked","unchecked");
        return;
    };
    //$(this).find(":checkbox").attr("checked","checked");
  });


/*  $(".list").toggle(
    function () {
      $(this).addClass("selected");
      $(this).find(":checkbox").addClass('active');
      $(this).find(":checkbox").attr("checked","checked");
      $("form :checkbox[class!='active']").checked = false; 
    },
    function () {
      $(this).removeClass("selected");
      $(this).find(":checkbox").removeClass('active');
      $(this).find(":checkbox").removeAttr('checked');
      $("form :checkbox[class!='active']").checked = false; 
    }
  );*/

  $("form .select_checkbox").each( function(){
//    $("form :checkbox:checked").each( function(){
//        $(this).removeAttr("checked");
//    });
//    $(this).attr("checked","checked");
  });

//  $('#edit-select_checkbox:checked')

/*  $('#edit-select_checkbox:checked').each(
    function() {
      // Insert code here
      $("form :checkbox[class!='active']").checked = false; 
    }
  );*/

  $("form .select_checkbox").bind('change', function(){
    $("form :checkbox:checked").each( function(){
      $(this).removeAttr("checked");
      $(this).parent().parent().removeClass("selected");
    });
    $(this).attr("checked","checked");
    $(this).parent().parent().addClass("selected");
//    $(this).checked = $(this).attr('checked');

/*    //$(this).parent().parent().toggleClass("selected");

    //if (this.checked) {
    //  $(this).toggleClass("active");    
    //};
    //this.checked = !this.checked;
    if ($(this).attr("checked")) {
        //do the stuff that you would do when 'checked'
        $(this).parent().parent().addClass("selected");
//        $(this).find(":checkbox").removeAttr("checked");
//        $(this).removeAttr("checked");
        $(this).addClass("active");    
        return;
    };
    $(this).parent().parent().removeClass("selected");
//    $(this).find(":checkbox").attr("checked","checked");
//    $(this).attr("checked","checked");
    $(this).removeClass("active");
    //Here do the stuff you want to do when 'unchecked'


//    $("form :checkbox[class!='active']").checked = false; */
  });



/*  $('.select_checkbox').each(function(item,intIndex) {
    //item.toggleClass('.select_checkbox_'+ $('.id').id );
    //item.addClass("active");
    item.checked = false;
    //$( this ).is(’:checked’);
//  function( intIndex ){  
    // Bind the onclick event to simply alert the
    // iteration index value.
    $( this ).bind(
      "click",
      function(){
        //alert( "Hottie index: " + intIndex );
        $(this).addClass("active");
        $(this).checked = true;
      }
    );  
//  }
 
  });
//  $('.select_checkbox_'+id ).checked = true;*/
    //$(".button").button();
});//////////////////onready////////////////////

function select_one(id) {
  $$('.select_checkbox').each(function(item) {
    item.checked = false;
  });
  $('.select_checkbox_'+id ).checked = true;
}

var request = function(options) {
  $.ajax($.extend({ url : options.url, type : 'get' }, options));
  return false;
};
 
// remote links handler
$('a[data-remote=true]').live('click', function() {
  return request({ url : this.href });
});

function fill_max_element(data,entity) {
  maxlength = '';
  curlength = 0;
  var i = 0;
  $.each(data, function(i){
    eval('curlength = data['+i+'].name.length');
    if(curlength > maxlength.length){
      eval('maxlength += data[' + i + '].name');
    }  
  });
  res = (maxlength.length > 0)?maxlength.replace(/./g,'-'):"---------------";
  return res;  
}

function fill_max_elem(data,entity) {
              maxlength = '';
              curlength = 0;
              alert(entity);
              $.each(data, function(i){
               //check for all the values for maximum value and compare it with default value    
                eval('curlength = data[i].' + entity + '.name.length');
                alert('curlength = data[i].' + entity + '.name.length');
                //if(data[0][i].city.name.length > maxlength.length){
                if(curlength > maxlength.length){
                  //maxlength += data[0][i].city.name;
                  eval('maxlength += data[i].' + entity + '.name');
                }  
              });
              res1 = (maxlength.length > 0)?maxlength.replace(/./g,'-'):"---------------";
              alert(entity);
              return res1;  
}
