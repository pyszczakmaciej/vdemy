// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

Turbo.setConfirmMethod((message, element) => {
    return new Promise((resolve) => {
        const modalHtml = `
      <div id="turbo-confirm-modal" class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-sm animate-fade-in">
        <div class="bg-white p-6 rounded-xl shadow-xl max-w-md w-full border border-slate-100 transform scale-95 transition-all">
          <h3 class="text-base font-bold text-slate-900 mb-2">Confirmation</h3>
          <p class="text-sm text-slate-600 mb-5">${message}</p>
          <div class="flex justify-end gap-3">
            <button id="confirm-cancel" class="px-4 py-2 text-sm font-semibold text-slate-700 bg-white border border-slate-200 rounded-lg hover:bg-slate-50">
              Cancel
            </button>
            <button id="confirm-success" class="px-4 py-2 text-sm font-semibold text-white bg-rose-600 rounded-lg hover:bg-rose-700">
              Confirm
            </button>
          </div>
        </div>
      </div>
    `

        document.body.insertAdjacentHTML('beforeend', modalHtml)
        const modal = document.getElementById('turbo-confirm-modal')

        const closeModal = (result) => {
            modal.remove()
            resolve(result)
        }

        document.getElementById('confirm-success').addEventListener('click', () => closeModal(true))
        document.getElementById('confirm-cancel').addEventListener('click', () => closeModal(false))

        modal.addEventListener('click', (e) => {
            if (e.target === modal) closeModal(false)
        })
    })
})