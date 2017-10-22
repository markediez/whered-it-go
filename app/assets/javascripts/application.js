// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// https://www.pluralsight.com/guides/ruby-ruby-on-rails/ruby-on-rails-nested-attributes#411TiKX2BPPcVKwK.99
$(document).on('turbolinks:load', function() {
  bind_events(this);
});


function setUniqueId(prependHtml, targetElements, targetAttribute, uniqueIndex) {
  var obj = $(prependHtml)
  if (obj.find('[data-form-prepend]').size() > 0) {
    obj.find('[data-form-prepend]').each(function() {
      var innerPrependHtml = $(this).attr('data-form-prepend');
      $(this).attr('data-form-prepend', function() {
        return setUniqueId(innerPrependHtml, targetElements, targetAttribute, uniqueIndex).prop('outerHTML')
      });
    });
  }

  // Base Case
  obj.find(targetElements).each( function() {
    $(this).attr( targetAttribute, function() {
      return $(this).attr(targetAttribute).replace( /new_record/, uniqueIndex);
    });
  });

  return obj;
}

function bind_events(area) {
  $('[data-form-prepend]', area).click( function(e) {
    uniqueIndex = (new Date()).getTime()
    var obj = setUniqueId($(this).attr("data-form-prepend"), 'input, select, textarea', 'name', uniqueIndex);

    bind_events(obj);
    obj.insertBefore( this );
    return false;
  });
}
