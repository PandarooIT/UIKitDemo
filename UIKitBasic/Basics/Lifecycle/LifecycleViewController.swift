//
//  LifecycleViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 19/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class LifecycleViewController: UIViewController {

    // 1. Chỉ chạy 1 lần duy nhất khi màn hình được sinh ra
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lifecycle"
        print("1️⃣ viewDidLoad: View đã được load vào bộ nhớ. (Setup UI, Data lần đầu tại đây)")
    }

    // 2. Chạy mỗi khi màn hình chuẩn bị xuất hiện
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2️⃣ viewWillAppear: View sắp hiện ra. (Ẩn hiện NavigationBar, reload data nhẹ)")
    }

    // 3. Chạy mỗi khi layout được tính toán (xoay màn hình, đổi size)
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("3️⃣ viewWillLayoutSubviews: Bắt đầu tính toán kích thước các view con.")
    }

    // 4. Chạy ngay sau khi layout xong
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("4️⃣ viewDidLayoutSubviews: Đã tính xong frame/bounds. (Bo tròn, Gradient tại đây)")
    }

    // 5. Chạy khi màn hình đã hiện hẳn lên mắt người dùng
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5️⃣ viewDidAppear: View đã hiện 100%. (Start animation, tracking API)")
    }

    // 6. Chạy khi màn hình sắp bị che đi hoặc tắt đi
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6️⃣ viewWillDisappear: View sắp biến mất. (Dừng animation, lưu data tạm)")
    }

    // 7. Chạy khi màn hình đã mất hẳn
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("7️⃣ viewDidDisappear: View đã biến mất hoàn toàn.")
        if let stack = navigationController?.viewControllers {
            print("📚 Stack hiện tại có \(stack.count) màn hình.")
            print("Danh sách: \(stack)")
        }
    }
    
    // 8. Khi ViewController bị hủy hoàn toàn khỏi bộ nhớ
    deinit {
        print("💀 deinit: ViewController đã bị hủy (Memory Reclaimed). Kiểm tra memory leak tại đây.")
    }
    
    
    @IBAction func navigateTap(_ sender: UIButton) {
        let userInteractionVC = UserInteractionViewController(nibName: "UserInteractionViewController", bundle: nil)

        navigationController?.pushViewController(userInteractionVC, animated: true)
    }
}
