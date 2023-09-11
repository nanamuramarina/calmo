class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :menu

  enum payment_method: { 銀行: 0 }
  enum tatus: { 宿泊予定: 0, 宿泊中: 1, 宿泊済み: 2, キャンセル: 3}

   with_options presence: true do
    validates :start_reservation_month
    validates :start_reservation_day
    validates :start_reservation_time
  end

   with_options presence: true do
    validates :end_reservation_month
    validates :end_reservation_day
    validates :end_reservation_time
  end

  with_options numericality: { only_integer: true } do
    validates :customer_id
    validates :menu_id
    validates :number
  end

  with_options length: { maximum: 2 } do
    validates :start_reservation_month
    validates :start_reservation_day
    validates :start_reservation_time
  end

  with_options length: { maximum: 2 } do
    validates :end_reservation_month
    validates :end_reservation_day
    validates :end_reservation_time
  end

   # 予約日時の結合
  def start_reservation_date
    "#{ start_reservation_year } / #{ start_reservation_month } /  #{ start_eservation_day } / #{ start_eservation_time }"
  end

  def end_reservation_date
    "#{ end_reservation_year } / #{ end_reservation_month } /  #{ end_eservation_day } / #{ end_eservation_time }"
  end
end
