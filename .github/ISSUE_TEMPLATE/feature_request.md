---
name: Feature Request 💡
description: Suggest a new feature or improvement
title: "Feature: "
labels: [enhancement, from-app]
assignees: czmatejt

body:
  - type: textarea
    attributes:
      label: What do you want to see?
      description: Describe the feature and why it would be useful.
    validations:
      required: true

  - type: dropdown
    attributes:
      label: Priority
      options:
        - Nice to have
        - Important
        - Urgent
---
