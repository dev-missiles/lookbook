desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  starting = Time.now

  if Rails.env.production?
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
  end

  User.delete_all
  Skill.delete_all
  Cohort.delete_all

  users = [
    {id: 91, email: "lucy@example.com", first_name: "Lucy", last_name: "Brown", image: "fakelucyimage123", cohort_id: 1, created_at: "2015-05-10 02:20:15", updated_at: "2019-11-01 12:10:00"},
    {id: 97, email: "kevin@example.com", first_name: "Kevin", last_name: "Johnson", image: "fakekevinimage456", cohort_id: 2, created_at: "2015-05-15 03:20:45", updated_at: "2019-11-03 14:05:00"},
    {id: 100, email: "emma@example.com", first_name: "Emma", last_name: "Miller", image: "fakeemmaimage789", cohort_id: 1, created_at: "2015-05-20 04:30:30", updated_at: "2019-11-05 16:20:00"},
    {id: 103, email: "mike@example.com", first_name: "Mike", last_name: "Davis", image: "fakemikeimage012", cohort_id: 2, created_at: "2015-05-22 05:40:40", updated_at: "2019-11-07 18:30:00"},
    {id: 106, email: "olivia@example.com", first_name: "Olivia", last_name: "Garcia", image: "fakeoliviaimage345", cohort_id: 1, created_at: "2015-05-27 06:50:50", updated_at: "2019-11-10 20:40:00"},
    {id: 110, email: "liam@example.com", first_name: "Liam", last_name: "Rodriguez", image: "fakeliamimage678", cohort_id: 2, created_at: "2015-05-30 07:00:00", updated_at: "2019-11-12 22:50:00"},
    {id: 112, email: "sophia@example.com", first_name: "Sophia", last_name: "Wilson", image: "fakesophiaimage901", cohort_id: 1, created_at: "2015-06-02 08:10:10", updated_at: "2019-11-15 01:30:00"},
    {id: 117, email: "noah@example.com", first_name: "Noah", last_name: "Peterson", image: "fakenoahimage234", cohort_id: 2, created_at: "2015-06-05 09:20:20", updated_at: "2019-11-17 03:40:00"},
    {id: 119, email: "mia@example.com", first_name: "Mia", last_name: "Taylor", image: "fakemiaimage567", cohort_id: 1, created_at: "2015-06-07 10:30:30", updated_at: "2019-11-19 05:50:00"},
    {id: 125, email: "ben@example.com", first_name: "Ben", last_name: "Moore", image: "fakebenimage891", cohort_id: 2, created_at: "2015-06-10 11:40:40", updated_at: "2019-11-21 07:00:00"},
    {id: 129, email: "ava@example.com", first_name: "Ava", last_name: "Martinez", image: "fakeavaimage213", cohort_id: 1, created_at: "2015-06-14 12:50:50", updated_at: "2019-11-23 09:10:00"},
    {id: 134, email: "jack@example.com", first_name: "Jack", last_name: "Anderson", image: "fakejackimage546", cohort_id: 2, created_at: "2015-06-17 13:00:00", updated_at: "2019-11-25 11:20:00"},
    {id: 138, email: "isabella@example.com", first_name: "Isabella", last_name: "Thomas", image: "fakeisabellaimage879", cohort_id: 1, created_at: "2015-06-20 14:10:10", updated_at: "2019-11-27 13:30:00"},
    {id: 142, email: "aiden@example.com", first_name: "Aiden", last_name: "Jackson", image: "fakeaidenimage012", cohort_id: 2, created_at: "2015-06-22 15:20:20", updated_at: "2019-11-29 15:40:00"},
    {id: 148, email: "sophie@example.com", first_name: "Sophie", last_name: "White", image: "fakesophieimage345", cohort_id: 1, created_at: "2015-06-26 16:30:30", updated_at: "2019-12-01 17:50:00"},
    {id: 152, email: "grayson@example.com", first_name: "Grayson", last_name: "Harris", image: "fakegraysonimage678", cohort_id: 2, created_at: "2015-06-29 17:40:40", updated_at: "2019-12-03 19:00:00"},
    {id: 157, email: "lily@example.com", first_name: "Lily", last_name: "Clark", image: "fakelilyimage901", cohort_id: 1, created_at: "2015-07-02 18:50:50", updated_at: "2019-12-05 21:10:00"},
    {id: 161, email: "leo@example.com", first_name: "Leo", last_name: "Lewis", image: "fakeleoimage234", cohort_id: 2, created_at: "2015-07-06 20:00:00", updated_at: "2019-12-07 23:20:00"},
    {id: 165, email: "zoe@example.com", first_name: "Zoe", last_name: "Lee", image: "fakezoeimage567", cohort_id: 1, created_at: "2015-07-10 21:10:10", updated_at: "2019-12-10 01:30:00"},
    {id: 170, email: "ethan@example.com", first_name: "Ethan", last_name: "Walker", image: "fakeethanimage891", cohort_id: 2, created_at: "2015-07-14 22:20:20", updated_at: "2019-12-12 03:40:00"}
  ]

  User.insert_all!(users)

  if User.method_defined?(:password) || User.has_attribute?(:password_digest)
    User.all.each do |user|
      user.password = "password"
      user.save
    end
    puts "Found a password column. Added passwords."
  else
    # puts "No password column found. Didn't add passwords."
  end

  skills = [
    {id: 1, prior_skills: "JavaScript, writing, gardening, yoga, and painting", user_id: 91, current_skills: "Python, Django, and team management", field_of_interest: "web development", github_link: "randomlink1.org", portfolio_link: "randomlink1.org", created_at: "2015-06-12 03:22:15", updated_at: "2019-11-02 12:35:00"},
    {id: 2, prior_skills: "Java, research, hiking, cycling, and cooking", user_id: 97, current_skills: "React, Node.js, and database administration", field_of_interest: "full-stack development", github_link: "randomlink2.org", portfolio_link: "randomlink2.org", created_at: "2015-06-18 04:25:45", updated_at: "2019-11-04 14:15:00"},
    {id: 3, prior_skills: "Python, reading, photography, swimming, and dancing", user_id: 100, current_skills: "Vue.js, PHP, and UI/UX design", field_of_interest: "front-end development", github_link: "randomlink3.org", portfolio_link: "randomlink3.org", created_at: "2015-06-23 05:33:30", updated_at: "2019-11-06 16:30:00"},
    {id: 4, prior_skills: "C#, public speaking, running, meditation, and baking", user_id: 103, current_skills: "HTML, CSS, and JavaScript", field_of_interest: "web design", github_link: "randomlink4.org", portfolio_link: "randomlink4.org", created_at: "2015-06-25 06:42:40", updated_at: "2019-11-08 18:40:00"},
    {id: 5, prior_skills: "Ruby, blogging, traveling, weightlifting, and drawing", user_id: 106, current_skills: "Data analysis, machine learning, and artificial intelligence", field_of_interest: "data science", github_link: "randomlink5.org", portfolio_link: "randomlink5.org", created_at: "2015-06-30 07:51:50", updated_at: "2019-11-11 20:50:00"},
    {id: 6, prior_skills: "PHP, social media, fishing, soccer, and singing", user_id: 110, current_skills: "Mobile app development, iOS, and Android", field_of_interest: "mobile app development", github_link: "randomlink6.org", portfolio_link: "randomlink6.org", created_at: "2015-07-02 08:10:00", updated_at: "2019-11-13 23:00:00"},
    {id: 7, prior_skills: "Go, marketing, birdwatching, basketball, and pottery", user_id: 112, current_skills: "Cloud computing, AWS, and Google Cloud Platform", field_of_interest: "cloud engineering", github_link: "randomlink7.org", portfolio_link: "randomlink7.org", created_at: "2015-07-05 09:18:10", updated_at: "2019-11-16 01:40:00"},
    {id: 8, prior_skills: "Perl, networking, gaming, tennis, and calligraphy", user_id: 117, current_skills: "Blockchain development, Ethereum, and Solidity", field_of_interest: "blockchain development", github_link: "randomlink8.org", portfolio_link: "randomlink8.org", created_at: "2015-07-08 10:26:20", updated_at: "2019-11-18 04:00:00"},
    {id: 9, prior_skills: "Swift, teaching, astronomy, baseball, and knitting", user_id: 119, current_skills: "UI/UX design, Figma, and Adobe Creative Suite", field_of_interest: "UI/UX design", github_link: "randomlink9.org", portfolio_link: "randomlink9.org", created_at: "2015-07-10 11:34:30", updated_at: "2019-11-20 06:20:00"},
    {id: 10, prior_skills: "Kotlin, event planning, origami, volleyball, and embroidery", user_id: 125, current_skills: "Embedded systems, C, and IoT", field_of_interest: "embedded systems", github_link: "randomlink10.org", portfolio_link: "randomlink10.org", created_at: "2015-07-13 12:42:40", updated_at: "2019-11-22 08:30:00"},
    {id: 11, prior_skills: "TypeScript, graphic design, woodworking, table tennis, and writing poetry", user_id: 129, current_skills: "Digital marketing, SEO, and social media", field_of_interest: "digital marketing", github_link: "randomlink11.org", portfolio_link: "randomlink11.org", created_at: "2015-07-17 13:50:50", updated_at: "2019-11-24 10:40:00"},
    {id: 12, prior_skills: "Rust, videography, archery, chess, and playing piano", user_id: 134, current_skills: "Cybersecurity, penetration testing, and ethical hacking", field_of_interest: "cybersecurity", github_link: "randomlink12.org", portfolio_link: "randomlink12.org", created_at: "2015-07-20 15:00:00", updated_at: "2019-11-26 12:50:00"},
    {id: 13, prior_skills: "Scala, analytics, kayaking, hiking, and playing guitar", user_id: 138, current_skills: "Project management, Scrum, and Agile methodologies", field_of_interest: "project management", github_link: "randomlink13.org", portfolio_link: "randomlink13.org", created_at: "2015-07-23 16:10:10", updated_at: "2019-11-28 14:20:00"},
    {id: 14, prior_skills: "Lua, e-commerce, camping, horseback riding, and painting", user_id: 142, current_skills: "Database management, SQL, and NoSQL", field_of_interest: "database administration", github_link: "randomlink14.org", portfolio_link: "randomlink14.org", created_at: "2015-07-25 17:20:20", updated_at: "2019-11-30 16:30:00"},
    {id: 15, prior_skills: "R, podcasting, sailing, billiards, and photography", user_id: 148, current_skills: "Virtualization, VMware, and Hyper-V", field_of_interest: "virtualization", github_link: "randomlink15.org", portfolio_link: "randomlink15.org", created_at: "2015-07-28 18:30:30", updated_at: "2019-12-02 18:40:00"},
    {id: 16, prior_skills: "Perl, public speaking, calligraphy, soccer, and playing violin", user_id: 152, current_skills: "Data analysis, Python, and R", field_of_interest: "data analysis", github_link: "randomlink16.org", portfolio_link: "randomlink16.org", created_at: "2015-07-31 19:40:40", updated_at: "2019-12-04 20:50:00"},
    {id: 17, prior_skills: "Shell scripting, debating, gardening, badminton, and sculpting", user_id: 157, current_skills: "Machine learning, TensorFlow, and PyTorch", field_of_interest: "machine learning", github_link: "randomlink17.org", portfolio_link: "randomlink17.org", created_at: "2015-08-03 20:50:50", updated_at: "2019-12-06 22:00:00"},
    {id: 18, prior_skills: "PowerShell, meditation, baking, basketball, and singing", user_id: 161, current_skills: "Cloud computing, AWS, and Azure", field_of_interest: "cloud computing", github_link: "randomlink18.org", portfolio_link: "randomlink18.org", created_at: "2015-08-06 22:00:00", updated_at: "2019-12-08 23:10:00"},
    {id: 19, prior_skills: "Ruby, yoga, birdwatching, tennis, and playing drums", user_id: 165, current_skills: "Mobile app development, Android, and iOS", field_of_interest: "mobile app development", github_link: "randomlink19.org", portfolio_link: "randomlink19.org", created_at: "2015-08-10 23:10:10", updated_at: "2019-12-11 01:20:00"},
    {id: 20, prior_skills: "PHP, finance, fishing, swimming, and composing music", user_id: 170, current_skills: "Artificial intelligence, deep learning, and neural networks", field_of_interest: "artificial intelligence", github_link: "randomlink20.org", portfolio_link: "randomlink20.org", created_at: "2015-08-14 00:20:20", updated_at: "2019-12-13 03:30:00"}
    ]
    Skill.insert_all!(skills)

    cohorts = [
      {id: 1, cohort_start: "2023-01-30", name: "Hash Rockets", cohort_end: "2023-4-20", created_at: "2019-01-26 13:33:04", updated_at: "2019-10-08 10:25:00"},
      {id: 2, cohort_start: "2023-02-15", name: "Full-Stack Pancakes", cohort_end:"2023-5-20", created_at: "2017-05-13 15:31:59", updated_at: "2019-10-08 10:25:00"},
    ]
    Cohort.insert_all!(cohorts)

    ending = Time.now
  elapsed = ending - starting

  puts "#{elapsed.to_i} seconds elapsed."
  puts "Generated sample Data"
end
