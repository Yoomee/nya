// provides autocomplete functionality for tags
$(document).ready(function() {
    $('.autocomplete-tags').each(function() {
        var placeholder = $(this).data('placeholder');
        var url = $(this).data('url');
        var saved = $(this).data('saved');
        $(this).select2({
            tags: true,
            placeholder: placeholder,
            minimumInputLength: 3,
            initSelection : function(element, callback){
              saved && callback(saved);
            },
            ajax: {
              url: url,
              dataType: 'json',
              data: function(term) {
                return {
                  q: term };
                },
              results: function(data) {
                return {
                  results: data
                };
              }
            },
            id: function(tag) {
							return tag.name;
						},
            createSearchChoice: function(term, data) {
                if ($(data).filter(function() {
                    return this.name.localeCompare(term)===0;
                }).length===0) {
                    return { id: term, name: term };
                }
            },
            formatResult: function(item, page) {
              return item.name;
            },
            formatSelection: function(item, page) {
              return item.name;
            }
        });
    });
});
