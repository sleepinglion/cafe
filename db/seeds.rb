# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Company.create!(id: 1, title: '피씨방')
Company.create!(id: 2, title: '매점')
Company.create!(id: 3, title: '임시 매점')

Branch.create!(id: 1, company_id: 1, title: '피씨방', sample: true)
Branch.create!(id: 2, company_id: 2, title: '매점')
Branch.create!(id: 3, company_id: 3, title: '임시 매점')

Admin.create!(:id=>1,:branch_id=>1,:email => 'admin@sleepinglion.pe.kr',:name=>'잠자는-사자',:password => '123456', :password_confirmation => '123456')
#Admin.create!(:id=>2,:branch_id=>2,:email => '',:name=>'매점 관리자',:password => '123456', :password_confirmation => '123456')
#Admin.create!(:id=>3,:branch_id=>3,:email => '',:name=>'매점 관리자',:password => '123456', :password_confirmation => '123456')

Payment.create!(:id=>1,:title=>'현금결제')
Payment.create!(:id=>2,:title=>'카드결제')
Payment.create!(:id=>3,:title=>'포인트결제')
Payment.create!(:id=>4,:title=>'추후청구')
Payment.create!(:id=>5,:title=>'핸드폰결제')
Payment.create!(:id=>6,:title=>'계좌이체')
Payment.create!(:id=>7,:title=>'가상계좌')
Payment.create!(:id=>8,:title=>'무통장입금')

BranchesPayment.create!(branch_id: 1, payment_id: 1)
BranchesPayment.create!(branch_id: 1, payment_id: 2)
BranchesPayment.create!(branch_id: 1, payment_id: 3)
BranchesPayment.create!(branch_id: 1, payment_id: 4)

BranchesPayment.create!(branch_id: 2, payment_id: 1)
BranchesPayment.create!(branch_id: 2, payment_id: 2)

BranchesPayment.create!(branch_id: 3, payment_id: 3)
BranchesPayment.create!(branch_id: 3, payment_id: 4)


AccountCategory.create!(id: 1, title: '구입', enable: true)
AccountCategory.create!(id: 2, title: '수정', enable: true)
AccountCategory.create!(id: 3, title: '환불', enable: true)
AccountCategory.create!(id: 4, title: '포인트충전', enable: true)
AccountCategory.create!(id: 5, title: '포인트환불', enable: true)

ProductCategory.create!(id: 1, branch_id: 1, title: '커피', enable: true)
ProductCategory.create!(id: 2, branch_id: 1, title: '음료', enable: true)
ProductCategory.create!(id: 3, branch_id: 1, title: '간식', enable: true)

ProductCategory.create!(id: 4, branch_id: 2, title: '커피', enable: true)
ProductCategory.create!(id: 5, branch_id: 2, title: '캔', enable: true)
ProductCategory.create!(id: 6, branch_id: 2, title: '빵', enable: true)

ProductCategory.create!(id: 7, branch_id: 3, title: '음료', enable: true)
ProductCategory.create!(id: 8, branch_id: 3, title: '과자', enable: true)

Product.create!(id: 1, branch_id: 1, product_category_id: 1, title: '아메리카노', price: 2000, enable: true)
Product.create!(id: 2, branch_id: 1, product_category_id: 1, title: '라떼', price: 2000, enable: true)
Product.create!(id: 3, branch_id: 1, product_category_id: 2, title: '우유', price: 2000, enable: true)
Product.create!(id: 4, branch_id: 1, product_category_id: 2, title: '콜라', price: 2000, enable: true)
Product.create!(id: 5, branch_id: 1, product_category_id: 2, title: '사이다', price: 2000, enable: true)
Product.create!(id: 6, branch_id: 1, product_category_id: 3, title: '라면', price: 2000, enable: true)
Product.create!(id: 7, branch_id: 1, product_category_id: 3, title: '빵', price: 2000, enable: true)
Product.create!(id: 8, branch_id: 2, product_category_id: 3, title: '과자', price: 2000, enable: true)
Product.create!(id: 9, branch_id: 2, product_category_id: 4, title: '아메리카노', price: 2000, enable: true)
Product.create!(id: 10, branch_id: 2, product_category_id: 4, title: '라떼', price: 2000, enable: true)
Product.create!(id: 11, branch_id: 2, product_category_id: 5, title: '사이다', price: 2000, enable: true)
Product.create!(id: 12, branch_id: 2, product_category_id: 5, title: '콜라', price: 2000, enable: true)
Product.create!(id: 13, branch_id: 2, product_category_id: 5, title: '주스', price: 2000, enable: true)
Product.create!(id: 14, branch_id: 2, product_category_id: 6, title: '단팥빵', price: 2000, enable: true)
Product.create!(id: 15, branch_id: 2, product_category_id: 6, title: '공갈빵', price: 2000, enable: true)
Product.create!(id: 16, branch_id: 3, product_category_id: 7, title: '콜라', price: 2000, enable: true)
Product.create!(id: 17, branch_id: 3, product_category_id: 8, title: '감자칩', price: 2000, enable: true)

User.create!(id: 1, branch_id: 1, name: '사용자1', phone: '111-1111')
User.create!(id: 2, branch_id: 1, name: '사용자2', phone: '222-2222')
User.create!(id: 3, branch_id: 1, name: '사용자3', phone: '333-3333')
User.create!(id: 4, branch_id: 1, name: '사용자4', phone: '444-4444')

User.create!(id: 5, branch_id: 2, name: '사용자4', phone: '555-5555')
User.create!(id: 6, branch_id: 2, name: '사용자4', phone: '666-6666')
User.create!(id: 7, branch_id: 2, name: '사용자4', phone: '777-7777')
User.create!(id: 8, branch_id: 2, name: '사용자4', phone: '888-8888')

User.create!(id: 9, branch_id: 3, name: '사용자4', phone: '999-9999')
User.create!(id: 10, branch_id: 3, name: '사용자4', phone: '121-1211')
User.create!(id: 11, branch_id: 3, name: '사용자4', phone: '333-4444')
User.create!(id: 12, branch_id: 3, name: '사용자4', phone: '444-5555')