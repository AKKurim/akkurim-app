---

name: Bug Report 🐛
description: Report something that's not working as expected
title: "Bug: "
labels: [bug, from-app]
assignees: czmatejt


body:
  - type: textarea
    attributes:
      label: What happened?
      description: Please describe the issue and what you expected to happen.
    validations:
      required: true

  - type: textarea
    attributes:
      label: Steps to reproduce
      description: How can we reproduce the bug?
    validations:
      required: false

  - type: input
    attributes:
      label: App version
      description: Which version was this on?
      placeholder: e.g. 1.0.3

  - type: dropdown
    attributes:
      label: Priority
      options:
        - Low
        - Medium
        - High

---
