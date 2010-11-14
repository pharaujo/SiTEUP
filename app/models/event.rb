class Event < ActiveRecord::Base
  belongs_to :event_type
  belongs_to :entity

  has_many :availabilities

  MONTHS = %w[Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro]

  validates_presence_of :name, :start_date, :end_date, :local
end
