class PwaController < ApplicationController
  def manifest
    render json: {
      name: "First Baptist Church of Enumclaw",
      short_name: "FBC Enumclaw",
      description: "The official app for First Baptist Church of Enumclaw, WA",
      start_url: "/",
      display: "standalone",
      background_color: "#1e3a5f",
      theme_color: "#1e3a5f",
      orientation: "portrait",
      icons: [
        { src: "/icon-192.png", sizes: "192x192", type: "image/png" },
        { src: "/icon-512.png", sizes: "512x512", type: "image/png" }
      ],
      categories: ["lifestyle", "social"],
      shortcuts: [
        { name: "Watch Sermon", url: "/sermons", icons: [{ src: "/icon-192.png", sizes: "192x192" }] },
        { name: "Upcoming Events", url: "/events", icons: [{ src: "/icon-192.png", sizes: "192x192" }] },
        { name: "Give", url: "/give", icons: [{ src: "/icon-192.png", sizes: "192x192" }] }
      ]
    }
  end

  def service_worker
    render js: ""
  end
end
