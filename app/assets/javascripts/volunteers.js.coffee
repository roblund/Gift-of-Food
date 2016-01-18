jQuery ->
    $("[name='volunteer[neighborhood_id]']").change ->
        selectedOption = $("option:selected", this)
        $(".map_thumb").removeClass "hidden_thing"
        $(".map_image").prop "src", "https://s3.amazonaws.com/media.thegiftoffood.org/small/" + selectedOption.data("file-id") + ".jpg"
        $(".map_link").prop "href", "https://s3.amazonaws.com/media.thegiftoffood.org/" + selectedOption.data("file-id") + ".jpg"
        $(".map_link").prop "title", selectedOption.text()
        $(".map_thumb_instructions").show()

    $("#region").change ->
        selectedRegion = this.value

        if selectedRegion == "Belgrade"
            regionEl = $("#region_5")
        else if ($.inArray selectedRegion, ["1","2","3","4"]) > -1
            regionEl = $("#region_" + selectedRegion)

        hideAllRegions()

        if regionEl
            regionEl.show()
            $("select", regionEl).prop("disabled", false)

    hideAllRegions = ->
        $.each(["1","2","3","4","5"], (index, value) ->
            region = $("#region_" + value)
            $("select", region).prop("disabled", true)
            region.hide()
        )
