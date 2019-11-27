# coding: utf-8

User.create!(email: "admin@example.com",
             password: "longpassword",
             password_confirmation: "longpassword",
             is_provider: false,
             is_admin: true)

User.create!(email: "provider@example.com",
             password: "longpassword",
             password_confirmation: "longpassword",
             is_provider: true,
             is_admin: false)

10.times do |n|
  User.create!(email: "user#{n}@example.com",
               password: "longpassword",
               password_confirmation: "longpassword",
               is_provider: false,
               is_admin: false)
end

ConditionType.create!(name: "Anxiety")
ConditionType.create!(name: "Mood")
ConditionType.create!(name: "Developmental")
ConditionType.create!(name: "Personality")
ConditionType.create!(name: "Psychotic")

ConditionType.find(2).conditions.create!(name: "Attention Deficit Hyperactivity Disorder (ADHD)",
                   description: "People with ADHD show a persistent pattern of inattention and/or"\
                                "hyperactivity-impulsivity that interferes with functioning or development.")
ConditionType.find(2).conditions.create!(name: "Oppositional Defiant Disorder",
                   description: "Children and adolescents with ODD may have trouble controlling their temper"\
                                "and are often disobedient and defiant toward others.")
ConditionType.find(3).conditions.create!(name: "Autism Spectrum Disorder (ASD)",
                   description: "Autism spectrum disorder (ASD) is a developmental disorder that makes it"\
                                "difficult to socialize and communicate with others.")
ConditionType.find(1).conditions.create!(name: "Generalized Anxiety Disorder (GAD)",
                   description: "Everyone experiences anxiety sometimes, but when it becomes overwhelming"\
                                "and repeatedly impacts a person's life, it may be an anxiety disorder.")
ConditionType.find(2).conditions.create!(name: "Major Depressive Disorder (MDD)",
                   description: "Depression is more than just feeling sad or going through a rough"\
                                "patch; it’s a serious mental health condition that requires understanding"\
                                "and treatment.")

5.times do |n|
  Insurance.create!(name: Faker::Company.name,
                    phone: Faker::PhoneNumber.cell_phone,
                    website: "www.provider#{n}.com")
end

Waiver.create!(name: "Health and Disability (HD)")
Waiver.create!(name: "AIDS/HIV (AH)")
Waiver.create!(name: "Elderly (E)")
Waiver.create!(name: "Intellectual Disability (ID)")
Waiver.create!(name: "Brain Injury (BI)")

8.times do |n|
  service = Service.new(name: "Service #{n}",
                        description: "This is service #{n}'s description.")
  (rand(3) + 1).times do
    condition = Condition.find(rand(5) + 1)
    service.conditions << condition
    waiver = Waiver.find(rand(5) + 1)
    service.waivers << waiver
  end
  service.save
end

20.times do |n|
  provider = Provider.new(name: Faker::Company.name,
                          address: Faker::Address.full_address,
                          phone: Faker::PhoneNumber.cell_phone,
                          description: "This is provider #{n}",
                          email: "provider#{n}@example.com")
  (rand(2) + 1).times do
    insurance = Insurance.find(rand(5) + 1)
    provider.insurances << insurance
  end
  (rand(5) + 1).times do
    service = Service.find(rand(8) + 1)
    provider.services << service
  end
  (rand(3) + 1).times do
    waiver = Waiver.find(rand(5) + 1)
    provider.waivers << waiver
  end
  provider.save
end
