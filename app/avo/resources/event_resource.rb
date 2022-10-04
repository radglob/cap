class EventResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :name, as: :text, required: true
  field :description, as: :trix, placeholder: "What's happening?", always_show: false
  field :start_time, as: :date_time
  field :end_time, as: :date_time
end
