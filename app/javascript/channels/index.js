// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

jQuery(function($){
    $(".deleteAction").onclick('ajax:success', function(){
        const current_item = $(this).parents('tr')[0]
        if(confirm("Are you sure you want to delete?")) {
            $.ajax({
                url: '/items/' + $(current_item).attr('data-item_id'),
                type: 'POST',
                data: {_method: 'DELETE'},
                success: function() {
                    $(current_item).fadeOut("slow")
                }
            })
        }
    })
})