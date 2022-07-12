class ApplicationController < Sinatra::Base

  # add routes
  set :default_content_type, 'application/json'

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(:price).reverse
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    pricey_good = BakedGood.all.max_by{ |pg| pg.price}
    pricey_good.to_json
  end

end
