name = ENV.fetch("SEED_USER_NAME")
email = ENV.fetch("SEED_USER_EMAIL")
password = ENV.fetch("SEED_USER_PASSWORD")

user = User.find_or_create_by!(email: email) do |u|
  u.name = name
  u.password = password
end

user.tasks.destroy_all

tasks = [
  {
    title: "Renderへデプロイする",
    completed: true,
    due_date: Date.current - 2.days,
    memo: "本番環境へデプロイ確認"
  },
  {
    title: "READMEを整理する",
    completed: true,
    due_date: Date.current - 1.day,
    memo: "使用技術と学習内容を整理"
  },
  {
    title: "RSpecを導入する",
    completed: false,
    due_date: Date.current + 1.day,
    memo: "model specから作成"
  },
  {
    title: "N+1問題を調査する",
    completed: false,
    due_date: Date.current + 2.days,
    memo: "includes/preload/eager_loadを確認"
  },
  {
    title: "Docker環境を構築する",
    completed: false,
    due_date: Date.current + 3.days,
    memo: "docker compose対応"
  },
  {
    title: "AWS ECSを調査する",
    completed: false,
    due_date: Date.current + 5.days,
    memo: "Fargate構成を確認"
  },
  {
    title: "ActiveRecordのscopeを整理する",
    completed: true,
    due_date: Date.current - 3.days,
    memo: "ordered_for_indexを見直す"
  },
  {
    title: "Turboを試す",
    completed: false,
    due_date: Date.current + 4.days,
    memo: "非同期更新を試す"
  },
  {
    title: "パフォーマンス改善を試す",
    completed: false,
    due_date: Date.current + 7.days,
    memo: "Bullet導入を検討"
  },
  {
    title: "面接デモを準備する",
    completed: false,
    due_date: Date.current,
    memo: "画面遷移と説明を整理"
  }
]

tasks.each do |task_data|
  task = user.tasks.build(task_data)

  if task.completed?
    task.completed_at = Time.current
  end

  task.save!
end

puts "Seed completed"
