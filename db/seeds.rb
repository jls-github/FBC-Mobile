# Clear existing data
[Announcement, PrayerRequest, Group, Event, Sermon, SermonSeries].each(&:destroy_all)

# Admin user
User.find_or_create_by!(email_address: "admin@fbcenumclaw.org") do |u|
  u.password = u.password_confirmation = "FBCadmin2026!"
end
puts "Admin login: admin@fbcenumclaw.org / FBCadmin2026!"

# Sermon Series
series1 = SermonSeries.create!(
  name: "Rooted in Grace",
  description: "A journey through the book of Ephesians, exploring what it means to be rooted and grounded in God's amazing grace.",
  year: 2026,
  featured: true,
  image_url: "https://images.unsplash.com/photo-1504052434569-70ad5836ab65?w=800&q=80"
)

series2 = SermonSeries.create!(
  name: "The Lord's Prayer",
  description: "An in-depth look at Jesus's model prayer and what it teaches us about our relationship with the Father.",
  year: 2026,
  image_url: "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?w=800&q=80"
)

series3 = SermonSeries.create!(
  name: "Stand Firm",
  description: "Finding strength and perseverance through life's trials by anchoring ourselves in Scripture.",
  year: 2025,
  image_url: "https://images.unsplash.com/photo-1500964757637-c85e8a162699?w=800&q=80"
)

# Sermons
Sermon.create!([
  {
    title: "Blessed with Every Spiritual Blessing",
    description: "We begin our series in Ephesians by exploring the incredible spiritual blessings that belong to every believer in Christ. Paul's opening doxology sets the stage for the entire letter.",
    speaker: "Pastor John Smith",
    preached_on: Date.today - 7,
    video_url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    duration_minutes: 42,
    sermon_series: series1,
    featured: true,
    scripture_reference: "Ephesians 1:1-14"
  },
  {
    title: "Chosen Before the Foundation",
    description: "God's sovereign election and our response to His calling. What does it mean to be chosen by God?",
    speaker: "Pastor John Smith",
    preached_on: Date.today - 14,
    video_url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    duration_minutes: 38,
    sermon_series: series1,
    scripture_reference: "Ephesians 1:4-6"
  },
  {
    title: "Our Father Who Art in Heaven",
    description: "Jesus begins the Lord's Prayer by establishing the intimate relationship we have with God as our Father. This week we explore what it means to approach God as Abba.",
    speaker: "Pastor John Smith",
    preached_on: Date.today - 21,
    video_url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    duration_minutes: 45,
    sermon_series: series2,
    scripture_reference: "Matthew 6:9"
  },
  {
    title: "When Trials Come",
    description: "James tells us to count it all joy when we face trials. But how? We explore God's purpose in our suffering and how to stand firm when life gets hard.",
    speaker: "Guest Speaker: Rev. Mike Thompson",
    preached_on: Date.today - 28,
    video_url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    duration_minutes: 40,
    sermon_series: series3,
    scripture_reference: "James 1:2-12"
  },
  {
    title: "Standing on the Promises",
    description: "God's promises are our anchor in the storms of life. This message explores how to activate faith by standing on what God has already said.",
    speaker: "Pastor John Smith",
    preached_on: Date.today - 35,
    duration_minutes: 37,
    sermon_series: series3,
    scripture_reference: "2 Peter 1:3-4"
  }
])

# Events
Event.create!([
  {
    title: "Sunday Worship Service",
    description: "Join us every Sunday for a time of worship, prayer, and the teaching of God's Word. We have classes for all ages during the 10:30 AM service.",
    starts_at: (Date.today.beginning_of_week + 6).to_time + 9.hours,
    ends_at: (Date.today.beginning_of_week + 6).to_time + 10.5.hours,
    location: "Main Sanctuary",
    address: "1016 Cole St, Enumclaw, WA 98022",
    category: "worship",
    featured: true,
    recurring: true
  },
  {
    title: "Wednesday Night Bible Study",
    description: "Mid-week fellowship and Bible study. We are currently working through the Gospel of John. All are welcome!",
    starts_at: (Date.today.beginning_of_week + 2).to_time + 19.hours,
    ends_at: (Date.today.beginning_of_week + 2).to_time + 20.5.hours,
    location: "Fellowship Hall",
    address: "1016 Cole St, Enumclaw, WA 98022",
    category: "general",
    recurring: true
  },
  {
    title: "Family BBQ & Picnic",
    description: "Our annual church family BBQ! Come enjoy food, fun, and fellowship with your church family. Bring a side dish to share. Burgers and hot dogs provided.",
    starts_at: Date.today.next_week.to_time + 12.hours,
    ends_at: Date.today.next_week.to_time + 16.hours,
    location: "Church Parking Lot & Grounds",
    address: "1016 Cole St, Enumclaw, WA 98022",
    category: "family",
    featured: true,
    image_url: "https://images.unsplash.com/photo-1529543544282-ea669407fca3?w=800&q=80"
  },
  {
    title: "Men's Breakfast",
    description: "Monthly men's fellowship breakfast with devotional and prayer. A great time to connect with other men in the church.",
    starts_at: Date.today.next_week.to_time + 7.5.hours,
    ends_at: Date.today.next_week.to_time + 9.hours,
    location: "Fellowship Hall",
    category: "men"
  },
  {
    title: "VBS Planning Meeting",
    description: "Volunteers needed! Come help plan our Vacation Bible School for this summer. We need teachers, helpers, and creative folks.",
    starts_at: (Date.today + 10).to_time + 18.5.hours,
    location: "Room 104",
    category: "kids"
  },
  {
    title: "Youth Group Pool Party",
    description: "Summer fun for all 6th-12th graders! Bring a towel, sunscreen, and a friend.",
    starts_at: (Date.today + 14).to_time + 14.hours,
    ends_at: (Date.today + 14).to_time + 17.hours,
    location: "Buckley Community Pool",
    category: "youth",
    image_url: "https://images.unsplash.com/photo-1571902943202-507ec2618e8f?w=800&q=80"
  }
])

# Small Groups
Group.create!([
  {
    name: "Iron Sharpens Iron Men's Group",
    description: "A men's small group focused on accountability, prayer, and working through Scripture together. We meet every other Tuesday evening.",
    leader_name: "Dave Hendricks",
    leader_email: "groups@fbcenumclaw.org",
    meeting_schedule: "Every other Tuesday, 7:00 PM",
    location: "Room 201",
    category: "mens",
    open_enrollment: true
  },
  {
    name: "Women of the Word",
    description: "A women's Bible study and fellowship group. Currently studying \"Knowing God\" by J.I. Packer. New members always welcome!",
    leader_name: "Sarah Mitchell",
    leader_email: "groups@fbcenumclaw.org",
    meeting_schedule: "Thursdays, 9:30 AM",
    location: "Library",
    category: "womens",
    open_enrollment: true
  },
  {
    name: "Young Adults Connect",
    description: "For adults ages 18-30. We share life, study the Word, and serve the community together. Very relational and fun!",
    leader_name: "Tyler & Megan Brooks",
    meeting_schedule: "Fridays, 7:00 PM",
    location: "Rotates – check newsletter",
    category: "young_adults",
    open_enrollment: true
  },
  {
    name: "Family Life Group – Sundays",
    description: "A multigenerational group for families with kids at home. We study, pray, and support each other through the beautiful chaos of family life.",
    leader_name: "Mark & Jennifer Adams",
    meeting_schedule: "Sundays, 5:00 PM",
    location: "Fellowship Hall Room A",
    category: "small_group",
    open_enrollment: true
  },
  {
    name: "55+ Fellowship Group",
    description: "Our active seniors group. We meet for Bible study, share a meal, and enjoy wonderful fellowship. Come as you are!",
    leader_name: "Bob & Carol Jensen",
    meeting_schedule: "Wednesdays, 10:00 AM",
    location: "Fellowship Hall",
    category: "seniors",
    open_enrollment: true
  }
])

# Announcements
Announcement.create!([
  {
    title: "New Sermon Series: Rooted in Grace",
    content: "We are excited to begin our new series through the book of Ephesians this Sunday! Pastor John will guide us through this powerful letter about our identity in Christ. Join us at 10:30 AM.",
    published_at: 2.days.ago,
    featured: true,
    position: 1,
    image_url: "https://images.unsplash.com/photo-1504052434569-70ad5836ab65?w=800&q=80"
  },
  {
    title: "Summer VBS Registration Open!",
    content: "Vacation Bible School registration is now open for kids ages 4-12. VBS will be July 14-18, 9 AM–12 PM. Register online or at the welcome center.",
    published_at: 1.week.ago,
    featured: false,
    position: 2,
    link_url: "#",
    link_label: "Register Now"
  },
  {
    title: "Serve with Food Bank Fridays",
    content: "Our monthly food bank ministry needs volunteers this Friday from 9 AM to noon. Show the love of Christ to our neighbors in need. Sign up at the welcome center or contact the church office.",
    published_at: 3.days.ago,
    position: 3
  },
  {
    title: "Offering Envelopes Available",
    content: "New giving envelopes for the year are available at the welcome center. You can also give online at any time using the Give button in the app.",
    published_at: 1.week.ago,
    position: 4
  }
])

puts "✅ Seed data created successfully!"
puts "  #{SermonSeries.count} sermon series"
puts "  #{Sermon.count} sermons"
puts "  #{Event.count} events"
puts "  #{Group.count} groups"
puts "  #{Announcement.count} announcements"
