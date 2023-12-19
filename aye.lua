local cb = {}

local ui_lib = LIB_UI.get()
local main = {}

main.tab = ui_lib.create_tab("Custom Buy")
main.tab:icon("~/MenuIcons/forest.png")

local hero_lib = LIB_HEROES_DATA
local my_data = hero_lib.get(nil, nil, nil)

main.update_variables = function ()

    my_data = hero_lib.get(nil, nil, nil)
end

hero_lib.add_func_to_reload_variables(main.update_variables)

cb.buy_b = function ()

    if not my_data.ref then return end

    Player.PrepareUnitOrders(

        my_data.player_ref,
        Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM,
        1164,
        Vector(0,0,0),
        1164,
        Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,
        my_data.ref
    )
end

cb.buy_r = function ()

    if not my_data.ref then return end

    Player.PrepareUnitOrders(

        my_data.player_ref,
        Enum.UnitOrder.DOTA_UNIT_ORDER_PURCHASE_ITEM,
        1801,
        Vector(0,0,0),
        1801,
        Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY,
        my_data.ref
    )
end

main.button = main.tab:button("Caster Rapier", cb.buy_r)
main.button = main.tab:button("Banana", cb.buy_b)

return cb
