jQuery ->
    $('#volunteer_neighborhood_id').change ->
        selectedOption = $('#volunteer_neighborhood_id option:selected')
        $('.map_thumb').removeClass 'hidden_thing'
        $('.map_image').attr 'src', 'https://s3.amazonaws.com/media.thegiftoffood.org/small/' + selectedOption.data('file-id') + '.jpg'
        $('.map_link').attr 'href', 'https://s3.amazonaws.com/media.thegiftoffood.org/' + selectedOption.data('file-id') + '.jpg'
        $('.map_link').attr 'title', selectedOption.text()
